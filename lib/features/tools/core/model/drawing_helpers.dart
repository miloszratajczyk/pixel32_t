import 'dart:math';
import 'dart:ui';

import 'package:flutter/gestures.dart';

extension PointIntToOffset on Point<int> {
  Offset toOffset() => Offset(x.toDouble(), y.toDouble());
}

extension OffsetToPointInt on Offset {
  Point<int> toIntPoint() => Point(dx.toInt(), dy.toInt());
}

List<Point<int>> getLinePoints(Point<int> start, Point<int> end) {
  int x0 = start.x.toInt();
  int y0 = start.y.toInt();
  int x1 = end.x.toInt();
  int y1 = end.y.toInt();

  List<Point<int>> points = [];

  int dx = (x1 - x0).abs();
  int dy = (y1 - y0).abs();

  int sx = x0 < x1 ? 1 : -1;
  int sy = y0 < y1 ? 1 : -1;

  int err = dx - dy;

  while (true) {
    points.add(Point<int>(x0, y0));

    if (x0 == x1 && y0 == y1) break;

    int e2 = 2 * err;
    if (e2 > -dy) {
      err -= dy;
      x0 += sx;
    }
    if (e2 < dx) {
      err += dx;
      y0 += sy;
    }
  }

  return points;
}
