// ignore_for_file: avoid_print

import 'circle_benchmark.dart';

void main() {
  final iterations = 1000;

  final t1 = runBenchmark(getCircleFilledPoints4, iterations);
  final t2 = runBenchmarkv(getCircleFilledPoints4v, iterations);
  final t3 = runBenchmarkv(getCircleFilledPoints4r, iterations);

  print('Point<int>: $t1 µs');
  print('IV2i: $t2 µs');
  print('record: $t3 µs');
}
