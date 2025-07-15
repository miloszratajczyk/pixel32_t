import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:pixel32_t/features/cloth/application/cloth_repository.dart';
import 'package:pixel32_t/features/tools/brush_tool/presentation/brush_tool_settings_view.dart';
import 'package:pixel32_t/features/tools/core/model/drawing_helpers.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';

class BrushTool extends Tool {
  @override
  String get name => "Brush";

  @override
  Widget buildSettingsView() => BrushToolSettingsView(brushTool: this);

  @override
  void onPointerDown(PointerEvent event, ClothRepository repository) {}

  @override
  void onPointerMove(PointerEvent event, ClothRepository repository) {
    final point = event.localPosition.toIntPoint();
    repository.setPixel(point);
    repository.setPixel(point - Point<int>(1, 0));
    repository.setPixel(point - Point<int>(0, 1));
    repository.setPixel(point + Point<int>(1, 0));
    repository.setPixel(point + Point<int>(0, 1));

    repository.markLayerForRedraw();
  }

  @override
  void onPointerUp(PointerEvent event, ClothRepository repository) {}

  @override
  void onPointerSignal(PointerEvent event, ClothRepository repository) {}
}
