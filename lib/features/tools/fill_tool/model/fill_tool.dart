import 'dart:collection';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';
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
  void onPointerDown(PointerEvent event, BuildContext context) {
    final repo = context.read<ClothRepository>();

    final startPoint = event.localPosition.toIntPoint();

    final targetColor = repo.getPixel(startPoint);

    final fillColor = event.buttons == kPrimaryButton
        ? repo.primaryColor
        : repo.secondaryColor;

    if (targetColor == fillColor) return;

    final visited = <Point<int>>{};
    final queue = Queue<Point<int>>();
    queue.add(startPoint);

    while (queue.isNotEmpty) {
      final point = queue.removeFirst();

      if (visited.contains(point)) continue;
      visited.add(point);

      final currentColor = repo.getPixel(point);
      if (currentColor != targetColor) continue;

      if (event.buttons == kPrimaryButton) {
        repo.drawPixelPrimary(point);
      } else {
        repo.drawPixelSecondary(point);
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
            neighbor.x < repo.width &&
            neighbor.y < repo.height) {
          queue.add(neighbor);
        }
      }
    }

    repo.markLayerForRedraw();
  }

  @override
  void onPointerMove(PointerEvent event, BuildContext context) {}

  @override
  void onPointerUp(PointerEvent event, BuildContext context) {}

  @override
  void onPointerSignal(PointerEvent event, BuildContext context) {}
}
