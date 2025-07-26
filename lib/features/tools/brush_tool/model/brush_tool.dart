import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';
import 'package:pixel32_t/features/tools/brush_tool/presentation/brush_tool_settings_view.dart';
import 'package:pixel32_t/features/tools/core/model/drawing_helpers.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';

class BrushTool extends Tool {
  @override
  String get name => "Brush";

  @override
  String get icon => "assets/icons/brush.svg";

  @override
  Widget buildSettingsView() => BrushToolSettingsView(brushTool: this);

  @override
  void onPointerDown(PointerEvent event, BuildContext context) {}

  @override
  void onPointerMove(PointerEvent event, BuildContext context) {
    final repo = context.read<ClothRepository>();
    final point = event.localPosition.toIntPoint();
    repo.setPixel(point);
    repo.setPixel(point - Point<int>(1, 0));
    repo.setPixel(point - Point<int>(0, 1));
    repo.setPixel(point + Point<int>(1, 0));
    repo.setPixel(point + Point<int>(0, 1));

    repo.markLayerForRedraw();
    repo.requestRedraw();
  }

  @override
  void onPointerUp(PointerEvent event, BuildContext context) {}

  @override
  void onPointerSignal(PointerEvent event, BuildContext context) {}
}
