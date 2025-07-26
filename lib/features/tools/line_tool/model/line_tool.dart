import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';
import 'package:pixel32_t/features/tools/core/model/drawing_helpers.dart';
import 'package:pixel32_t/features/tools/line_tool/presentation/line_tool_settings_view.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';

class LineTool extends Tool {
  Point<int>? startPoint;
  int eventButtons = 0;

  @override
  String get name => "Line";

  @override
  String get icon => "assets/icons/pecil.svg";

  @override
  Widget buildSettingsView() => LineToolSettingsView(lineTool: this);

  @override
  void onPointerDown(PointerEvent event, BuildContext context) {
    final repo = context.read<ClothRepository>();
    final point = event.localPosition.toIntPoint();

    eventButtons = event.buttons;
    if (eventButtons == kPrimaryButton) {
      repo.drawPixelPrimary(point);
    } else if (eventButtons == kSecondaryButton) {
      repo.drawPixelSecondary(point);
    }
    startPoint = point;

    repo.flushLayerPreview();
    repo.previewLayer.visible = true;

    repo.markLayerForRedraw();
  }

  @override
  void onPointerMove(PointerEvent event, BuildContext context) {
    final repo = context.read<ClothRepository>();
    final point = event.localPosition.toIntPoint();

    if (startPoint == null) {
      startPoint = point;
      return;
    }

    final points = getLinePoints(startPoint!, point);

    repo.flushLayerPreview();
    if (eventButtons == kPrimaryButton) {
      points.forEach(repo.drawPixelPrimaryPreview);
    } else if (eventButtons == kSecondaryButton) {
      points.forEach(repo.drawPixelSecondaryPreview);
    }

    repo.markLayerForRedraw();
  }

  @override
  void onPointerUp(PointerEvent event, BuildContext context) {
    final repo = context.read<ClothRepository>();
    final point = event.localPosition.toIntPoint();

    if (startPoint == null) {
      return;
    }

    final points = getLinePoints(startPoint!, point);

    if (eventButtons == kPrimaryButton) {
      points.forEach(repo.drawPixelPrimary);
    } else if (eventButtons == kSecondaryButton) {
      points.forEach(repo.drawPixelSecondary);
    }

    eventButtons = 0;

    repo.previewLayer.visible = false;

    repo.markLayerForRedraw();
  }

  @override
  void onPointerSignal(PointerEvent event, BuildContext context) {}
}
