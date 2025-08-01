import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';
import 'package:pixel32_t/core/model/v2i.dart';
import 'package:pixel32_t/features/tools/brush_tool/view/brush_tool_settings_view.dart';
import 'package:pixel32_t/features/tools/core/model/drawing_helpers.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';
import 'package:pixel32_t/features/tools/core/repo/tool_repository.dart';
import 'package:pixel32_t/features/tools/eraser_tool/view/eraser_tool_settings_view.dart';

class EraserTool extends Tool {
  EraserTool({this.radius = 2}) {
    _brushShape = getCircleBrushShape(radius);
  }

  double radius;

  V2i? _lastPosition;
  List<V2i> _brushShape = [];

  @override
  String get name => "Eraser";

  @override
  String get icon => "assets/icons/eraser.svg";

  @override
  Widget buildSettingsView() => EraserToolSettingsView();

  @override
  void onPointerDown(PointerDownEvent event, BuildContext context) {
    final clothRepository = context.read<ClothRepository>();
    final point = event.localPosition.toV2i();

    _lastPosition = point;

    for (final brushPoint in _brushShape) {
      clothRepository.erasePixel(point + brushPoint);
    }

    clothRepository.activeLayer.markForRedraw();
    clothRepository.requestRedraw();
  }

  @override
  void onPointerMove(PointerMoveEvent event, BuildContext context) {
    final clothRepository = context.read<ClothRepository>();
    final point = event.localPosition.toV2i();
    if (_lastPosition == point) return;

    _lastPosition ??= point;
    // Set insted of a list to avoid storing the same points multiple times
    final points = <V2i>{};
    // Add _brushShape points translated by all points on the line
    for (final point in getLinePoints(_lastPosition!, point)) {
      points.addAll(_brushShape.map((e) => e + point));
    }
    // Draw all points
    for (final point in points) {
      clothRepository.erasePixel(point);
    }

    clothRepository.activeLayer.markForRedraw();
    clothRepository.requestRedraw();

    _lastPosition = point;
  }

  @override
  void onPointerUp(PointerUpEvent event, BuildContext context) {}

  @override
  void onPointerSignal(PointerSignalEvent event, BuildContext context) {}

  EraserTool copyWith({double? radius}) {
    return EraserTool(radius: radius ?? this.radius);
  }
}
