import 'dart:collection';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';
import 'package:pixel32_t/features/core/model/v2i.dart';
import 'package:pixel32_t/features/selection_layer/cubit/selection_cubit.dart';
import 'package:pixel32_t/features/tools/core/model/drawing_helpers.dart';
import 'package:pixel32_t/features/tools/core/repo/tool_repository.dart';
import 'package:pixel32_t/features/tools/fill_tool/view/fill_tool_settings_view.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';
import 'package:flutter/material.dart';
import 'package:pixel32_t/features/tools/wand_tool/view/wand_tool_settings_view.dart';

class WandTool extends Tool {
  WandTool({this.tolerance = 0, this.isContinuous = true});

  double tolerance;
  bool isContinuous;

  @override
  String get name => "Magic Wand";

  @override
  String get icon => "assets/icons/wand.svg";

  @override
  Widget buildSettingsView() => WandToolSettingsView();

  void selectContinuous(PointerDownEvent event, BuildContext context) {
    final clothRepository = context.read<ClothRepository>();
    final selectionCubit = context.read<SelectionCubit>();
    final startPoint = event.localPosition.toV2i();
    final targetColor = clothRepository.getPixel(startPoint);

    if (event.buttons == kPrimaryButton) {
      selectionCubit.deselectAll();
    } else {
      selectionCubit.selectAll();
    }

    final visited = <V2i>{};
    final queue = Queue<V2i>();
    queue.add(startPoint);

    while (queue.isNotEmpty) {
      final point = queue.removeFirst();

      if (visited.contains(point)) continue;
      visited.add(point);

      // Check similarity
      final currentColor = clothRepository.getPixel(point);
      if (colorDistance(currentColor, targetColor) > tolerance) continue;

      if (event.buttons == kPrimaryButton) {
        selectionCubit.select(point);
      } else {
        selectionCubit.deselect(point);
      }

      for (var offset in [V2i(0, -1), V2i(0, 1), V2i(-1, 0), V2i(1, 0)]) {
        final neighbor = V2i(point.x + offset.x, point.y + offset.y);
        if (!visited.contains(neighbor) &&
            neighbor.x >= 0 &&
            neighbor.y >= 0 &&
            neighbor.x < clothRepository.width &&
            neighbor.y < clothRepository.height) {
          queue.add(neighbor);
        }
      }
    }

    selectionCubit.commit();
  }

  void selectDiscontinuous(PointerDownEvent event, BuildContext context) {
    final clothRepository = context.read<ClothRepository>();
    final selectionCubit = context.read<SelectionCubit>();
    final startPoint = event.localPosition.toV2i();
    final targetColor = clothRepository.getPixel(startPoint);

    if (event.buttons == kPrimaryButton) {
      selectionCubit.deselectAll();
    } else {
      selectionCubit.selectAll();
    }

    for (int x = 0; x < clothRepository.width; x++) {
      for (int y = 0; y < clothRepository.height; y++) {
        final point = V2i(x, y);
        final currentColor = clothRepository.getPixel(point);
        if (colorDistance(currentColor, targetColor) <= tolerance) {
          if (event.buttons == kPrimaryButton) {
            selectionCubit.select(point);
          } else {
            selectionCubit.deselect(point);
          }
        }
      }
    }

    selectionCubit.commit();
  }

  @override
  void onPointerDown(PointerDownEvent event, BuildContext context) {
    if (isContinuous) {
      selectContinuous(event, context);
    } else {
      selectDiscontinuous(event, context);
    }
  }

  @override
  void onPointerMove(PointerMoveEvent event, BuildContext context) {}

  @override
  void onPointerUp(PointerUpEvent event, BuildContext context) {}

  @override
  void onPointerSignal(PointerSignalEvent event, BuildContext context) {}

  WandTool copyWith({double? tolerance, bool? isContinuous}) {
    return WandTool(
      tolerance: tolerance ?? this.tolerance,
      isContinuous: isContinuous ?? this.isContinuous,
    );
  }
}
