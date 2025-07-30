import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ColorPicker extends StatefulWidget {
  final void Function(Color color) onColorSelected;

  const ColorPicker({super.key, required this.onColorSelected});

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  double hue = 0.0;
  double saturation = 1.0;
  double value = 1.0;
  double alpha = 1.0;

  void _onSVBoxChanged(Offset localPos, Size size) {
    setState(() {
      saturation = (localPos.dx / size.width).clamp(0.0, 1.0);
      value = 1.0 - (localPos.dy / size.height).clamp(0.0, 1.0);
    });
    _emitColor();
  }

  void _onHueChanged(double dx, double width) {
    setState(() {
      hue = (dx / width * 360).clamp(0.0, 360.0);
    });
    _emitColor();
  }

  void _onAlphaChanged(double dx, double width) {
    setState(() {
      alpha = (dx / width).clamp(0.0, 1.0);
    });
    _emitColor();
  }

  void _emitColor() {
    final color = HSVColor.fromAHSV(alpha, hue, saturation, value).toColor();
    widget.onColorSelected(color);
  }

  @override
  Widget build(BuildContext context) {
    final selectedColor = HSVColor.fromAHSV(
      alpha,
      hue,
      saturation,
      value,
    ).toColor();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // SV Box
        GestureDetector(
          onPanDown: (details) =>
              _onSVBoxChanged(details.localPosition, context.size!),
          onPanUpdate: (details) =>
              _onSVBoxChanged(details.localPosition, context.size!),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final size = Size(constraints.maxWidth, 100);
              return CustomPaint(size: size, painter: _SVPainter(hue));
            },
          ),
        ),
        const SizedBox(height: 16),

        // Hue slider
        GestureDetector(
          onPanDown: (details) =>
              _onHueChanged(details.localPosition.dx, context.size!.width),
          onPanUpdate: (details) =>
              _onHueChanged(details.localPosition.dx, context.size!.width),
          child: Container(
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              gradient: LinearGradient(
                colors: List.generate(
                  361,
                  (i) =>
                      HSVColor.fromAHSV(1.0, i.toDouble(), 1.0, 1.0).toColor(),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Opacity slider
        GestureDetector(
          onPanDown: (details) =>
              _onAlphaChanged(details.localPosition.dx, context.size!.width),
          onPanUpdate: (details) =>
              _onAlphaChanged(details.localPosition.dx, context.size!.width),
          child: Container(
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              gradient: LinearGradient(
                colors: [
                  HSVColor.fromAHSV(0.0, hue, saturation, value).toColor(),
                  HSVColor.fromAHSV(1.0, hue, saturation, value).toColor(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SVPainter extends CustomPainter {
  final double hue;

  _SVPainter(this.hue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Horizontal: Saturation
    final satShader = ui.Gradient.linear(Offset.zero, Offset(size.width, 0), [
      HSVColor.fromAHSV(1.0, hue, 0.0, 1.0).toColor(),
      HSVColor.fromAHSV(1.0, hue, 1.0, 1.0).toColor(),
    ]);

    paint.shader = satShader;
    canvas.drawRect(Offset.zero & size, paint);

    // Vertical: Value
    final valueShader = ui.Gradient.linear(
      Offset(0, 0),
      Offset(0, size.height),
      [Colors.transparent, Colors.black],
    );

    final valuePaint = Paint()
      ..shader = valueShader
      ..blendMode = BlendMode.multiply;

    canvas.drawRect(Offset.zero & size, valuePaint);
  }

  @override
  bool shouldRepaint(covariant _SVPainter oldDelegate) =>
      oldDelegate.hue != hue;
}
