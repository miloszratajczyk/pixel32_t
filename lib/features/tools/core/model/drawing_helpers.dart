import 'dart:math';
import 'dart:ui';
import 'package:pixel32_t/features/core/model/v2i.dart';

extension OffsetToV2i on Offset {
  V2i toV2i() => V2i(dx.toInt(), dy.toInt());
}

List<V2i> getLinePoints(V2i start, V2i end) {
  int x0 = start.x.toInt();
  int y0 = start.y.toInt();
  int x1 = end.x.toInt();
  int y1 = end.y.toInt();

  List<V2i> points = [];

  int dx = (x1 - x0).abs();
  int dy = (y1 - y0).abs();

  int sx = x0 < x1 ? 1 : -1;
  int sy = y0 < y1 ? 1 : -1;

  int err = dx - dy;

  while (true) {
    points.add(V2i(x0, y0));

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

List<V2i> getRectangleBorderPoints(V2i a, V2i b) {
  final left = min(a.x, b.x);
  final right = max(a.x, b.x);
  final top = min(a.y, b.y);
  final bottom = max(a.y, b.y);

  final points = <V2i>[];

  for (int x = left; x <= right; x++) {
    points.add(V2i(x, top));
    points.add(V2i(x, bottom));
  }
  for (int y = top + 1; y < bottom; y++) {
    points.add(V2i(left, y));
    points.add(V2i(right, y));
  }

  return points;
}

List<V2i> getRectangleFilledPoints(V2i a, V2i b) {
  final left = min(a.x, b.x);
  final right = max(a.x, b.x);
  final top = min(a.y, b.y);
  final bottom = max(a.y, b.y);

  final points = <V2i>[];
  for (int y = top; y <= bottom; y++) {
    for (int x = left; x <= right; x++) {
      points.add(V2i(x, y));
    }
  }

  return points;
}

List<V2i> getCircleBorderPoints(V2i center, V2i edge) {
  final points = <V2i>[];

  final dx = edge.x - center.x;
  final dy = edge.y - center.y;
  final radius = sqrt(dx * dx + dy * dy).toInt();

  int x = radius;
  int y = 0;
  int err = 0;

  while (x >= y) {
    points.add(V2i(center.x + x, center.y + y));
    points.add(V2i(center.x + y, center.y + x));
    points.add(V2i(center.x - y, center.y + x));
    points.add(V2i(center.x - x, center.y + y));
    points.add(V2i(center.x - x, center.y - y));
    points.add(V2i(center.x - y, center.y - x));
    points.add(V2i(center.x + y, center.y - x));
    points.add(V2i(center.x + x, center.y - y));

    if (err < 0) {
      y += 1;
      err += 2 * y + 1;
    } else {
      x -= 1;
      err -= 2 * x + 1;
    }
  }

  points.removeWhere(
    (p) =>
        (p.x == center.x &&
            (p.y == center.y + radius || p.y == center.y - radius)) ||
        (p.y == center.y &&
            (p.x == center.x + radius || p.x == center.x - radius)),
  );

  return points;
}

List<V2i> getCircleFilledPoints(V2i center, V2i edge) {
  final points = <V2i>[];

  final dx = edge.x - center.x;
  final dy = edge.y - center.y;
  final radius = sqrt(dx * dx + dy * dy).toInt();

  final rSq = radius * radius;
  for (int y = 0; y < radius; y++) {
    final ySq = y * y;
    for (int x = 0; x < radius; x++) {
      if (x * x + ySq <= rSq) {
        points.add(V2i(center.x + x, center.y + y));
        points.add(V2i(center.x - x, center.y + y));
        points.add(V2i(center.x - x, center.y - y));
        points.add(V2i(center.x + x, center.y - y));
      }
    }
  }

  return points;
}

List<V2i> getCircleBrushShape(double radius) {
  if (radius <= 1) {
    return [V2i(0, 0)];
  }
  if (radius <= 2) {
    return [V2i(0, 0), V2i(1, 0), V2i(-1, 0), V2i(0, 1), V2i(0, -1)];
  }
  final points = <V2i>[];

  final rSq = radius * radius;
  for (int y = 0; y < radius; y++) {
    final ySq = y * y;
    for (int x = 0; x < radius; x++) {
      if (x * x + ySq <= rSq) {
        points.add(V2i(x, y));
        points.add(V2i(-x, y));
        points.add(V2i(-x, -y));
        points.add(V2i(x, -y));
      }
    }
  }

  return points;
}

double colorDistance(Color a, Color b) {
  return ((a.r - b.r).abs() +
          (a.g - b.g).abs() +
          (a.b - b.b).abs() +
          (a.a - b.a).abs()) *
      0.25;
}

List<V2i> getPolygonBorderPoints(List<V2i> path, {bool shouldClose = true}) {
  final points = <V2i>{};
  for (int i = 0; i < path.length - 1; i++) {
    points.addAll(getLinePoints(path[i], path[i + 1]));
  }
  if (shouldClose && path.length > 2) {
    points.addAll(getLinePoints(path.last, path.first));
  }
  return points.toList();
}

/// TODO I dont even know
List<V2i> scanlineFillPolygon(List<V2i> polygon) {
  if (polygon.length < 3) return [];

  // Find min and max Y
  int minY = polygon.map((p) => p.y).reduce((a, b) => a < b ? a : b);
  int maxY = polygon.map((p) => p.y).reduce((a, b) => a > b ? a : b);

  final filledPoints = <V2i>{};

  for (int y = minY; y <= maxY; y++) {
    final intersections = <int>[];

    for (int i = 0; i < polygon.length; i++) {
      final p1 = polygon[i];
      final p2 = polygon[(i + 1) % polygon.length];

      // Skip horizontal edges
      if (p1.y == p2.y) continue;

      // Make sure p1.y < p2.y
      final V2i top = p1.y < p2.y ? p1 : p2;
      final V2i bottom = p1.y < p2.y ? p2 : p1;

      // Check if the scanline intersects the edge
      if (y >= top.y && y < bottom.y) {
        // Intersect X using linear interpolation
        final dy = bottom.y - top.y;
        final dx = bottom.x - top.x;
        final t = (y - top.y) / dy;
        final x = top.x + (dx * t);
        intersections.add(x.floor());
      }
    }

    // Sort and fill between pairs
    intersections.sort();
    for (int i = 0; i + 1 < intersections.length; i += 2) {
      int xStart = intersections[i];
      int xEnd = intersections[i + 1];
      for (int x = xStart; x <= xEnd; x++) {
        filledPoints.add(V2i(x, y));
      }
    }
  }

  return filledPoints.toList();
}
