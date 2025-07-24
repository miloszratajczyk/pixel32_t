import 'dart:math' as math;

import 'package:flutter/foundation.dart';

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
