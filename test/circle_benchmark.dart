import 'dart:math';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';

// Version 5 is the fastest but the circle is asymetric by one pixel and looks off, so verinon four it is.

void main() {
  final iterations = 1000;

  final t1 = runBenchmark(getCircleFilledPoints1, iterations);
  final t2 = runBenchmark(getCircleFilledPoints2, iterations);
  final t3 = runBenchmark(getCircleFilledPoints3, iterations);
  final t4 = runBenchmark(getCircleFilledPoints4, iterations);
  final t5 = runBenchmark(getCircleFilledPoints5, iterations);

  print('t1: $t1 µs');
  print('t2: $t2 µs');
  print('t3: $t3 µs');
  print('t4: $t4 µs');
  print('t5: $t5 µs');
}

@immutable
final class IV2i {
  const IV2i(this.x, this.y);
  final int x, y;

  IV2i operator +(IV2i other) => IV2i(x + other.x, y + other.y);
  IV2i operator -(IV2i other) => IV2i(x - other.x, y - other.y);
  double get magnitude => math.sqrt((x * x + y * y).toDouble());
  @override
  bool operator ==(Object other) =>
      other is IV2i && other.x == x && other.y == y;

  @override
  int get hashCode => Object.hash(x, y);

  @override
  String toString() => 'V2i($x, $y)';
}

int runBenchmark(Function(Point<int>, Point<int>) fn, int iterations) {
  final center = Point(100, 100);
  final edge = Point(130, 100);

  final stopwatch = Stopwatch()..start();
  for (int i = 0; i < iterations; i++) {
    fn(center, edge);
  }
  stopwatch.stop();

  return stopwatch.elapsedMicroseconds;
}

int runBenchmarkv(Function(IV2i, IV2i) fn, int iterations) {
  final center = IV2i(100, 100);
  final edge = IV2i(130, 100);

  final stopwatch = Stopwatch()..start();
  for (int i = 0; i < iterations; i++) {
    fn(center, edge);
  }
  stopwatch.stop();

  return stopwatch.elapsedMicroseconds;
}

List<Point<int>> getCircleFilledPoints1(Point<int> center, Point<int> edge) {
  final radius = (center - edge).magnitude.toInt();
  final points = <Point<int>>[];

  for (int y = -radius + 1; y < radius; y++) {
    for (int x = -radius + 1; x < radius; x++) {
      if (x * x + y * y <= radius * radius) {
        points.add(Point(center.x + x, center.y + y));
      }
    }
  }

  return points;
}

List<Point<int>> getCircleFilledPoints2(Point<int> center, Point<int> edge) {
  final radius = (center - edge).magnitude.toInt();
  final points = <Point<int>>[];

  for (int y = -radius + 1; y < radius; y++) {
    final ySq = y * y;
    final xLimit = sqrt(radius * radius - ySq).floor();

    for (int x = -xLimit + 1; x < xLimit; x++) {
      points.add(Point(center.x + x, center.y + y));
    }
  }

  return points;
}

List<Point<int>> getCircleFilledPoints3(Point<int> center, Point<int> edge) {
  final radius = (center - edge).magnitude.toInt();
  final points = <Point<int>>[];

  for (int y = 0; y < radius; y++) {
    for (int x = 0; x < radius; x++) {
      if (x * x + y * y <= radius * radius) {
        points.addAll([
          Point(center.x + x, center.y + y),
          Point(center.x - x, center.y + y),
          Point(center.x - x, center.y - y),
          Point(center.x + x, center.y - y),
        ]);
      }
    }
  }

  return points;
}

List<Point<int>> getCircleFilledPoints4(Point<int> center, Point<int> edge) {
  final radius = (center - edge).magnitude.toInt();
  final points = <Point<int>>[];

  final rSq = radius * radius;
  for (int y = 0; y < radius; y++) {
    final ySq = y * y;
    for (int x = 0; x < radius; x++) {
      if (x * x + ySq <= rSq) {
        points.add(Point(center.x + x, center.y + y));
        points.add(Point(center.x - x, center.y + y));
        points.add(Point(center.x - x, center.y - y));
        points.add(Point(center.x + x, center.y - y));
      }
    }
  }

  return points;
}

List<IV2i> getCircleFilledPoints4v(IV2i center, IV2i edge) {
  final radius = (center - edge).magnitude.toInt();
  final points = <IV2i>[];

  final rSq = radius * radius;
  for (int y = 0; y < radius; y++) {
    final ySq = y * y;
    for (int x = 0; x < radius; x++) {
      if (x * x + ySq <= rSq) {
        points.add(IV2i(center.x + x, center.y + y));
        points.add(IV2i(center.x - x, center.y + y));
        points.add(IV2i(center.x - x, center.y - y));
        points.add(IV2i(center.x + x, center.y - y));
      }
    }
  }

  return points;
}

List<(int, int)> getCircleFilledPoints4r(IV2i center, IV2i edge) {
  final radius = (center - edge).magnitude.toInt();
  final points = <(int, int)>[];

  final rSq = radius * radius;
  for (int y = 0; y < radius; y++) {
    final ySq = y * y;
    for (int x = 0; x < radius; x++) {
      if (x * x + ySq <= rSq) {
        points.add((center.x + x, center.y + y));
        points.add((center.x - x, center.y + y));
        points.add((center.x - x, center.y - y));
        points.add((center.x + x, center.y - y));
      }
    }
  }

  return points;
}

List<Point<int>> getCircleFilledPoints5(Point<int> center, Point<int> edge) {
  final radius = (center - edge).magnitude.toInt();
  final points = <Point<int>>[];

  final rSq = radius * radius;

  for (int y = 0; y < radius; y++) {
    final xLimit = sqrt(rSq - y * y).floor();

    for (int x = 0; x < xLimit; x++) {
      points.add(Point(center.x + x, center.y + y));
      points.add(Point(center.x - x, center.y + y));
      points.add(Point(center.x - x, center.y - y));
      points.add(Point(center.x + x, center.y - y));
    }
  }

  return points;
}
