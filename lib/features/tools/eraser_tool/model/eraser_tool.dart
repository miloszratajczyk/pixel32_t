import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:pixel32_t/features/cloth/application/cloth_repository.dart';
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
  void onPointerDown(
    PointerEvent event,
    ClothRepository repository,
    BuildContext context,
  ) {}

  @override
  void onPointerMove(
    PointerEvent event,
    ClothRepository repository,
    BuildContext context,
  ) {
    final centerX = event.localPosition.dx.toInt();
    final centerY = event.localPosition.dy.toInt();
    repository.erasePixel(Point<int>(centerX, centerY));
    repository.erasePixel(Point<int>(centerX - 1, centerY));
    repository.erasePixel(Point<int>(centerX + 1, centerY));
    repository.erasePixel(Point<int>(centerX, centerY - 1));
    repository.erasePixel(Point<int>(centerX, centerY + 1));

    repository.markLayerForRedraw();
  }

  @override
  void onPointerUp(
    PointerEvent event,
    ClothRepository repository,
    BuildContext context,
  ) {}

  @override
  void onPointerSignal(
    PointerEvent event,
    ClothRepository repository,
    BuildContext context,
  ) {}
}
