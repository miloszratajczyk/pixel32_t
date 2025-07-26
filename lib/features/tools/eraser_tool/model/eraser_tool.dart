import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';
import 'package:pixel32_t/features/tools/eraser_tool/presentation/eraser_tool_settings_view.dart';

class EraserTool extends Tool {
  @override
  String get name => "Eraser";

  @override
  String get icon => "assets/icons/eraser.svg";

  @override
  Widget buildSettingsView() => EraserToolSettingsView(eraserTool: this);

  @override
  void onPointerDown(PointerEvent event, BuildContext context) {}

  @override
  void onPointerMove(PointerEvent event, BuildContext context) {
    final repo = context.read<ClothRepository>();
    final centerX = event.localPosition.dx.toInt();
    final centerY = event.localPosition.dy.toInt();
    repo.erasePixel(Point<int>(centerX, centerY));
    repo.erasePixel(Point<int>(centerX - 1, centerY));
    repo.erasePixel(Point<int>(centerX + 1, centerY));
    repo.erasePixel(Point<int>(centerX, centerY - 1));
    repo.erasePixel(Point<int>(centerX, centerY + 1));

    repo.markLayerForRedraw();
  }

  @override
  void onPointerUp(PointerEvent event, BuildContext context) {}

  @override
  void onPointerSignal(PointerEvent event, BuildContext context) {}
}
