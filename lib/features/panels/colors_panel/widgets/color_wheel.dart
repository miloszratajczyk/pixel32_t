import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class ColorWheel extends StatefulWidget {
  final void Function(Color) onColorSelected;

  const ColorWheel({super.key, required this.onColorSelected});

  @override
  State<ColorWheel> createState() => _ColorWheelState();
}

class _ColorWheelState extends State<ColorWheel> {
  double _hue = 0.0;
  double _saturation = 1.0;
  double _value = 1.0;

  void _handleTap(Offset position, Size size) {
    final Offset center = size.center(Offset.zero);
    final Offset offset = position - center;
    final double radius = size.width / 2;

    final double distance = offset.distance;
    final double angle = atan2(offset.dy, offset.dx);

    if (distance > radius || distance < radius * 0.6) {
      return; // Outside hue ring
    }

    setState(() {
      _hue = (angle * 180 / pi + 360) % 360;
    });

    final color = HSVColor.fromAHSV(1.0, _hue, _saturation, _value).toColor();
    widget.onColorSelected(color);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (details) => _handleTap(details.localPosition, context.size!),
      onPanUpdate: (details) =>
          _handleTap(details.localPosition, context.size!),
      child: CustomPaint(
        painter: _ColorWheelPainter(_hue),
        size: const Size(300, 300),
      ),
    );
  }
}

class _ColorWheelPainter extends CustomPainter {
  final double hue;

  _ColorWheelPainter(this.hue);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2;

    // Draw hue ring
    final ringPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.4;

    const segments = 360;
    for (int i = 0; i < segments; i++) {
      final color = HSVColor.fromAHSV(1.0, i.toDouble(), 1.0, 1.0).toColor();
      final angle = 2 * pi * (i / segments);
      final x = cos(angle);
      final y = sin(angle);

      final start = center + Offset(x, y) * (radius * 0.6);
      final end = center + Offset(x, y) * radius;

      ringPaint.color = color;
      canvas.drawLine(start, end, ringPaint);
    }

    // Optional: Draw selector indicator
    final indicatorAngle = hue * pi / 180;
    final indicatorOffset =
        center +
        Offset(cos(indicatorAngle), sin(indicatorAngle)) * radius * 0.9;
    canvas.drawCircle(indicatorOffset, 6, Paint()..color = Colors.white);
    canvas.drawCircle(indicatorOffset, 3, Paint()..color = Colors.black);
  }

  @override
  bool shouldRepaint(covariant _ColorWheelPainter oldDelegate) =>
      oldDelegate.hue != hue;
}
