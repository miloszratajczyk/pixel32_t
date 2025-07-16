import 'dart:collection';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:pixel32_t/features/cloth/application/cloth_repository.dart';
import 'package:pixel32_t/features/tools/core/model/drawing_helpers.dart';
import 'package:pixel32_t/features/tools/fill_tool/presentation/fill_tool_settings_view.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';
import 'package:flutter/material.dart';

class FillTool extends Tool {
  int tolerance = 10;

  @override
  String get name => "Fill";

  @override
  String get icon => "assets/icons/fill.svg";

  @override
  Widget buildSettingsView() => FillToolSettingsView(fillTool: this);

  @override
  void onPointerDown(
    PointerEvent event,
    ClothRepository repository,
    BuildContext context,
  ) {
    final startPoint = event.localPosition.toIntPoint();

    final targetColor = repository.getPixel(startPoint);

    final fillColor = event.buttons == kPrimaryButton
        ? repository.primaryColor
        : repository.secondaryColor;

    if (targetColor == fillColor) return;

    final visited = <Point<int>>{};
    final queue = Queue<Point<int>>();
    queue.add(startPoint);

    while (queue.isNotEmpty) {
      final point = queue.removeFirst();

      if (visited.contains(point)) continue;
      visited.add(point);

      final currentColor = repository.getPixel(point);
      if (currentColor != targetColor) continue;

      if (event.buttons == kPrimaryButton) {
        repository.drawPixelPrimary(point);
      } else {
        repository.drawPixelSecondary(point);
      }

      for (var offset in [
        Point(0, -1),
        Point(0, 1),
        Point(-1, 0),
        Point(1, 0),
      ]) {
        final neighbor = Point(point.x + offset.x, point.y + offset.y);
        if (!visited.contains(neighbor) &&
            neighbor.x > 0 &&
            neighbor.y > 0 &&
            neighbor.x < repository.width &&
            neighbor.y < repository.height) {
          queue.add(neighbor);
        }
      }
    }

    repository.markLayerForRedraw();
  }

  @override
  void onPointerMove(
    PointerEvent event,
    ClothRepository repository,
    BuildContext context,
  ) {}

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
