import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:pixel32_t/features/cloth/application/cloth_repository.dart';
import 'package:pixel32_t/features/tools/core/model/drawing_helpers.dart';
import 'package:pixel32_t/features/tools/line_tool/presentation/line_tool_settings_view.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';

class LineTool extends Tool {
  Point<int>? startPoint;
  int eventButtons = 0;

  @override
  String get name => "Line";

  @override
  Widget buildSettingsView() => LineToolSettingsView(lineTool: this);

  @override
  void onPointerDown(PointerEvent event, ClothRepository repository) {
    final point = event.localPosition.toIntPoint();

    eventButtons = event.buttons;
    if (eventButtons == kPrimaryButton) {
      repository.drawPixelPrimary(point);
    } else if (eventButtons == kSecondaryButton) {
      repository.drawPixelSecondary(point);
    }
    startPoint = point;

    repository.flushLayerPreview();
    repository.previewLayer.visible = true;

    repository.markLayerForRedraw();
  }

  @override
  void onPointerMove(PointerEvent event, ClothRepository repository) {
    final point = event.localPosition.toIntPoint();

    if (startPoint == null) {
      startPoint = point;
      return;
    }

    final points = getLinePoints(startPoint!, point);

    repository.flushLayerPreview();
    if (eventButtons == kPrimaryButton) {
      points.forEach(repository.drawPixelPrimaryPreview);
    } else if (eventButtons == kSecondaryButton) {
      points.forEach(repository.drawPixelSecondaryPreview);
    }

    repository.markLayerForRedraw();
  }

  @override
  void onPointerUp(PointerEvent event, ClothRepository repository) {
    final point = event.localPosition.toIntPoint();

    if (startPoint == null) {
      return;
    }

    final points = getLinePoints(startPoint!, point);

    if (eventButtons == kPrimaryButton) {
      points.forEach(repository.drawPixelPrimary);
    } else if (eventButtons == kSecondaryButton) {
      points.forEach(repository.drawPixelSecondary);
    }

    eventButtons = 0;

    repository.previewLayer.visible = false;

    repository.markLayerForRedraw();
  }

  @override
  void onPointerSignal(PointerEvent event, ClothRepository repository) {}
}
