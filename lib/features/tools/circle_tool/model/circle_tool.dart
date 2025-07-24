import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/application/cloth_repository.dart';
import 'package:pixel32_t/features/tools/circle_tool/presentation/circle_tool_settings_view.dart';
import 'package:pixel32_t/features/tools/core/model/drawing_helpers.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';

class CircleTool extends Tool {
  CircleTool({this.shouldFill = false});
  bool shouldFill;

  Point<int>? _centerPoint;
  bool _isPrimary = true;

  @override
  String get name => "Circle";

  @override
  String get icon => "assets/icons/circle.svg";

  @override
  Widget buildSettingsView() => CircleToolSettingsView();

  @override
  void onPointerDown(PointerEvent event, BuildContext context) {
    final repo = context.read<ClothRepository>();
    final point = event.localPosition.toIntPoint();

    _isPrimary = event.buttons == kPrimaryButton;
    _centerPoint = point;

    repo.flushLayerPreview();
    repo.previewLayer.visible = true;

    repo.markLayerForRedraw();
    repo.requestRedraw();
  }

  @override
  void onPointerMove(PointerEvent event, BuildContext context) {
    final repo = context.read<ClothRepository>();
    if (_centerPoint == null) return;

    final edgePoint = event.localPosition.toIntPoint();
    final points = shouldFill
        ? getCircleFilledPoints(_centerPoint!, edgePoint)
        : getCircleBorderPoints(_centerPoint!, edgePoint);

    repo.flushLayerPreview();

    if (_isPrimary) {
      points.forEach(repo.drawPixelPrimaryPreview);
    } else {
      points.forEach(repo.drawPixelSecondaryPreview);
    }

    repo.requestRedraw();
  }

  @override
  void onPointerUp(PointerEvent event, BuildContext context) {
    final repo = context.read<ClothRepository>();
    if (_centerPoint == null) return;

    final edgePoint = event.localPosition.toIntPoint();
    final points = shouldFill
        ? getCircleFilledPoints(_centerPoint!, edgePoint)
        : getCircleBorderPoints(_centerPoint!, edgePoint);

    if (_isPrimary) {
      points.forEach(repo.drawPixelPrimary);
    } else {
      points.forEach(repo.drawPixelSecondary);
    }

    _centerPoint = null;
    repo.previewLayer.visible = false;

    repo.markLayerForRedraw();
    repo.requestRedraw();
  }

  @override
  void onPointerSignal(PointerEvent event, BuildContext context) {}

  CircleTool copyWith({bool? shouldFill}) {
    return CircleTool(shouldFill: shouldFill ?? this.shouldFill);
  }

  @override
  List<Object?> get props => [name, shouldFill];
}
