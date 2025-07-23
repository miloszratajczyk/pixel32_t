import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/selection_layer/cubit/selection_cubit.dart';
import 'package:pixel32_t/features/selection_layer/selection_layer.dart';

class SelectionLayerOverlay extends StatefulWidget {
  const SelectionLayerOverlay({super.key});

  @override
  State<SelectionLayerOverlay> createState() => _SelectionLayerOverlayState();
}

class _SelectionLayerOverlayState extends State<SelectionLayerOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectionState = context.watch<SelectionCubit>().state;
    final path = selectionState.getBorderPath();
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => CustomPaint(
        size: Size(
          selectionState.width.toDouble(),
          selectionState.height.toDouble(),
        ),
        painter: _SelectionAnimatedPainter(path: path, anim: _controller.value),
      ),
    );
  }
}

class _SelectionAnimatedPainter extends CustomPainter {
  final Path path;
  final double anim;

  _SelectionAnimatedPainter({required this.path, required this.anim});

  @override
  void paint(Canvas canvas, Size size) {
    final dashedPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = .5
      ..style = PaintingStyle.stroke;

    for (final metric in path.computeMetrics()) {
      if (anim < 0.5) {
        canvas.drawPath(
          metric.extractPath(
            (0.0 + anim) * metric.length,
            (0.5 + anim) * metric.length,
          ),
          dashedPaint,
        );
      } else {
        canvas.drawPath(
          metric.extractPath(0.0, (anim - 0.5) * metric.length),
          dashedPaint,
        );

        canvas.drawPath(
          metric.extractPath((anim) * metric.length, metric.length),
          dashedPaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant _SelectionAnimatedPainter oldDelegate) {
    return oldDelegate.path != path || anim != anim;
  }
}
