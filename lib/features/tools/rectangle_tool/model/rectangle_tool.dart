import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/application/cloth_repository.dart';
import 'package:pixel32_t/features/tools/core/model/drawing_helpers.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';
import 'package:pixel32_t/features/tools/rectangle_tool/presentation/rectangle_tool_settings_view.dart';

class RectangleTool extends Tool {
  Point<int>? _startPoint;
  bool _isPrimary = true;
  // Settings
  bool shouldFill = false;

  RectangleTool({this.shouldFill = false});

  @override
  String get name => "Rectangle";

  @override
  String get icon => "assets/icons/rectangle.svg";

  @override
  Widget buildSettingsView() => RectangleToolSettingsView(rectangleTool: this);

  @override
  void onPointerDown(PointerEvent event, BuildContext context) {
    final repo = context.read<ClothRepository>();
    final point = event.localPosition.toIntPoint();

    _isPrimary = event.buttons == kPrimaryButton;
    _startPoint = point;

    repo.flushLayerPreview();
    repo.previewLayer.visible = true;

    repo.markLayerForRedraw();
    repo.requestRedraw();
  }

  @override
  void onPointerMove(PointerEvent event, BuildContext context) {
    final repo = context.read<ClothRepository>();
    if (_startPoint == null) return;

    final currentPoint = event.localPosition.toIntPoint();
    final points = shouldFill
        ? getRectangleFilledPoints(_startPoint!, currentPoint)
        : getRectangleBorderPoints(_startPoint!, currentPoint);

    repo.flushLayerPreview();

    if (_isPrimary) {
      points.forEach(repo.drawPixelPrimaryPreview);
    } else {
      points.forEach(repo.drawPixelSecondaryPreview);
    }

    repo.markLayerForRedraw();
    repo.requestRedraw();
  }

  @override
  void onPointerUp(PointerEvent event, BuildContext context) {
    final repo = context.read<ClothRepository>();
    if (_startPoint == null) return;

    final currentPoint = event.localPosition.toIntPoint();
    final points = shouldFill
        ? getRectangleFilledPoints(_startPoint!, currentPoint)
        : getRectangleBorderPoints(_startPoint!, currentPoint);

    if (_isPrimary) {
      points.forEach(repo.drawPixelPrimary);
    } else {
      points.forEach(repo.drawPixelSecondary);
    }

    _startPoint = null;
    repo.previewLayer.visible = false;

    repo.markLayerForRedraw();
    repo.requestRedraw();
  }

  @override
  void onPointerSignal(PointerEvent event, BuildContext context) {}
  RectangleTool copyWith({bool? shouldFill}) {
    return RectangleTool(shouldFill: shouldFill ?? this.shouldFill);
  }

  @override
  List<Object?> get props => [name, shouldFill];
}
