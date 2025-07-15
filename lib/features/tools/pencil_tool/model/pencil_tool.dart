import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:pixel32_t/features/cloth/application/cloth_repository.dart';
import 'package:pixel32_t/features/tools/core/model/drawing_helpers.dart';
import 'package:pixel32_t/features/tools/pencil_tool/presentation/pencil_tool_settings_view.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';

class PencilTool extends Tool {
  Point<int>? lastPosition;

  @override
  String get name => "Pencil";

  @override
  Widget buildSettingsView() => PencilToolSettingsView(pencilTool: this);

  @override
  void onPointerDown(PointerEvent event, ClothRepository repository) {
    final point = event.localPosition.toIntPoint();

    if (event.buttons == kPrimaryButton) {
      repository.drawPixelPrimary(point);
    } else if (event.buttons == kSecondaryButton) {
      repository.drawPixelSecondary(point);
    }
    lastPosition = point;

    repository.markLayerForRedraw();
  }

  @override
  void onPointerMove(PointerEvent event, ClothRepository repository) {
    final point = event.localPosition.toIntPoint();

    if (lastPosition == null) {
      lastPosition = point;
      return;
    }

    final points = getLinePoints(lastPosition!, point);

    if (event.buttons == kPrimaryButton) {
      points.forEach(repository.drawPixelPrimary);
    } else if (event.buttons == kSecondaryButton) {
      points.forEach(repository.drawPixelSecondary);
    }

    lastPosition = point;

    repository.markLayerForRedraw();
  }

  @override
  void onPointerUp(PointerEvent event, ClothRepository repository) {
    lastPosition = null;
  }

  @override
  void onPointerSignal(PointerEvent event, ClothRepository repository) {}
}
