import 'dart:collection';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';
import 'package:pixel32_t/features/core/model/v2i.dart';
import 'package:pixel32_t/features/tools/core/model/drawing_helpers.dart';
import 'package:pixel32_t/features/tools/core/repo/tool_repository.dart';
import 'package:pixel32_t/features/tools/fill_tool/view/fill_tool_settings_view.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';
import 'package:flutter/material.dart';

class FillTool extends Tool {
  FillTool({this.tolerance = 0, this.isContinuous = true});

  double tolerance;
  bool isContinuous;

  @override
  String get name => "Fill";

  @override
  String get icon => "assets/icons/fill.svg";

  @override
  Widget buildSettingsView() => FillToolSettingsView();

  void _fillContinuous(PointerDownEvent event, BuildContext context) {
    final clothRepository = context.read<ClothRepository>();
    final toolRepository = context.read<ToolRepository>();
    final startPoint = event.localPosition.toV2i();

    final targetColor = clothRepository.getPixel(startPoint);
    final fillColor = event.buttons == kPrimaryButton
        ? toolRepository.primaryColor
        : toolRepository.secondaryColor;
    if (targetColor == fillColor) return;

    clothRepository.previewLayer.flush();
    clothRepository.previewLayer.show();

    final pointsToDraw = <V2i>{};
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

      pointsToDraw.add(point);

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

    for (final point in pointsToDraw) {
      clothRepository.setPixel(point, fillColor);
    }

    clothRepository.previewLayer.markForRedraw();
    clothRepository.requestRedraw(shouldCommit: true);
  }

  void _fillDiscontinuous(PointerDownEvent event, BuildContext context) {
    final clothRepository = context.read<ClothRepository>();
    final toolRepository = context.read<ToolRepository>();
    final startPoint = event.localPosition.toV2i();

    final targetColor = clothRepository.getPixel(startPoint);
    final fillColor = event.buttons == kPrimaryButton
        ? toolRepository.primaryColor
        : toolRepository.secondaryColor;
    if (targetColor == fillColor) return;

    clothRepository.previewLayer.flush();
    clothRepository.previewLayer.show();

    final pointsToDraw = <V2i>{};
    for (int x = 0; x < clothRepository.width; x++) {
      for (int y = 0; y < clothRepository.height; y++) {
        final point = V2i(x, y);
        final currentColor = clothRepository.getPixel(point);
        if (colorDistance(currentColor, targetColor) <= tolerance) {
          pointsToDraw.add(point);
        }
      }
    }

    for (final point in pointsToDraw) {
      clothRepository.setPixel(point, fillColor);
    }

    clothRepository.previewLayer.markForRedraw();
    clothRepository.requestRedraw(shouldCommit: true);
  }

  @override
  void onPointerDown(PointerDownEvent event, BuildContext context) {
    if (isContinuous) {
      _fillContinuous(event, context);
    } else {
      _fillDiscontinuous(event, context);
    }
  }

  @override
  void onPointerMove(PointerMoveEvent event, BuildContext context) {}

  @override
  void onPointerUp(PointerUpEvent event, BuildContext context) {}

  @override
  void onPointerSignal(PointerSignalEvent event, BuildContext context) {}

  FillTool copyWith({double? tolerance, bool? isContinuous}) {
    return FillTool(
      tolerance: tolerance ?? this.tolerance,
      isContinuous: isContinuous ?? this.isContinuous,
    );
  }
}
