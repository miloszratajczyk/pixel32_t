import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';
import 'package:pixel32_t/features/tools/core/model/drawing_helpers.dart';
import 'package:pixel32_t/features/tools/pencil_tool/presentation/pencil_tool_settings_view.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';

part 'pencil_tool.freezed.dart';

@unfreezed
class PencilTool with _$PencilTool implements Tool {
  @override
  Point<int>? lastPosition;

  @override
  String get name => "Pencil";

  @override
  String get icon => "assets/icons/pencil.svg";

  @override
  Widget buildSettingsView() => PencilToolSettingsView(pencilTool: this);

  @override
  void onPointerDown(PointerEvent event, BuildContext context) {
    final repo = context.read<ClothRepository>();
    final point = event.localPosition.toIntPoint();

    if (event.buttons == kPrimaryButton) {
      repo.drawPixelPrimary(point);
    } else if (event.buttons == kSecondaryButton) {
      repo.drawPixelSecondary(point);
    }
    lastPosition = point;

    repo.markLayerForRedraw();
  }

  @override
  void onPointerMove(PointerEvent event, BuildContext context) {
    final repo = context.read<ClothRepository>();
    final point = event.localPosition.toIntPoint();

    if (lastPosition == null) {
      lastPosition = point;
      return;
    }

    final points = getLinePoints(lastPosition!, point);

    if (event.buttons == kPrimaryButton) {
      points.forEach(repo.drawPixelPrimary);
    } else if (event.buttons == kSecondaryButton) {
      points.forEach(repo.drawPixelSecondary);
    }

    lastPosition = point;

    repo.markLayerForRedraw();
  }

  @override
  void onPointerUp(PointerEvent event, BuildContext context) {
    lastPosition = null;
  }

  @override
  void onPointerSignal(PointerEvent event, BuildContext context) {}
}
