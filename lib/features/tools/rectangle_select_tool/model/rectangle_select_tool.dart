import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';
import 'package:pixel32_t/features/selection_layer/cubit/selection_cubit.dart';
import 'package:pixel32_t/features/tools/core/model/drawing_helpers.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';
import 'package:pixel32_t/features/tools/rectangle_select_tool/presentation/rectangle_tool_settings_view.dart';
import 'package:pixel32_t/features/tools/rectangle_tool/presentation/rectangle_tool_settings_view.dart';

class RectangleSelectTool extends Tool {
  Point<int>? _startPoint;
  bool _isPrimary = true;

  @override
  String get name => "Rectangle Select";

  @override
  String get icon => "assets/icons/rectangle_select.svg";

  @override
  Widget buildSettingsView() => RectangleSelectToolSettingsView();

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
    final points = getRectangleFilledPoints(_startPoint!, currentPoint);

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
    final selection = context.read<SelectionCubit>();
    if (_startPoint == null) return;

    final currentPoint = event.localPosition.toIntPoint();
    final points = getRectangleFilledPoints(_startPoint!, currentPoint);

    if (_isPrimary) {
      points.forEach(selection.state.select);
    } else {
      points.forEach(selection.state.deselect);
    }
    selection.commit();

    _startPoint = null;
    repo.previewLayer.visible = false;

    repo.markLayerForRedraw();
    repo.requestRedraw();
  }

  @override
  void onPointerSignal(PointerEvent event, BuildContext context) {}

  @override
  List<Object?> get props => [name];
}
