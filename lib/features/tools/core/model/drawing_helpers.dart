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

List<Point<int>> getRectangleBorderPoints(Point<int> a, Point<int> b) {
  final left = min(a.x, b.x);
  final right = max(a.x, b.x);
  final top = min(a.y, b.y);
  final bottom = max(a.y, b.y);

  final points = <Point<int>>[];

  for (int x = left; x <= right; x++) {
    points.add(Point(x, top));
    points.add(Point(x, bottom));
  }
  for (int y = top + 1; y < bottom; y++) {
    points.add(Point(left, y));
    points.add(Point(right, y));
  }

  return points;
}

List<Point<int>> getRectangleFilledPoints(Point<int> a, Point<int> b) {
  final left = min(a.x, b.x);
  final right = max(a.x, b.x);
  final top = min(a.y, b.y);
  final bottom = max(a.y, b.y);

  final points = <Point<int>>[];
  for (int y = top; y <= bottom; y++) {
    for (int x = left; x <= right; x++) {
      points.add(Point(x, y));
    }
  }
  return points;
}
