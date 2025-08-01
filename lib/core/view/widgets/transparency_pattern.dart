import 'package:flutter/material.dart';

class TransparencyPattern extends StatelessWidget {
  /// Draws a checkerboard pattern representing transparency,
  /// if [child] is provided acts like a backgraund for the widget,
  /// if no [child] is provided grows and should be used in a stack.
  const TransparencyPattern({
    this.child,
    this.squareSize = 1.0,
    this.lightColor = const Color(0xFFFFFFFF),
    this.darkColor = const Color(0xFFBBBBBB),
    super.key,
  });

  final Widget? child;
  final double squareSize;
  final Color lightColor;
  final Color darkColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: CustomPaint(
        painter: _TransparencyPainter(
          squareSize: squareSize,
          lightColor: lightColor,
          darkColor: darkColor,
        ),
        size: Size.infinite,
        child: child,
      ),
    );
  }
}

class _TransparencyPainter extends CustomPainter {
  final double squareSize;
  final Color lightColor;
  final Color darkColor;

  _TransparencyPainter({
    required this.squareSize,
    required this.lightColor,
    required this.darkColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rowsCount = (size.height / squareSize).ceil();
    final columnsCount = (size.width / squareSize).ceil();
    final paint = Paint()..color = darkColor;

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = lightColor,
    );

    for (int row = 0; row < rowsCount; row++) {
      final leftOffset = row % 2 == 0 ? squareSize : 0;
      for (int col = 0; col < columnsCount; col += 2) {
        final rect = Rect.fromLTWH(
          leftOffset + (col * squareSize),
          row * squareSize,
          squareSize,
          squareSize,
        );
        canvas.drawRect(rect, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
