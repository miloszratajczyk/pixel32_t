import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CanvasEditor extends StatefulWidget {
  const CanvasEditor({super.key});

  @override
  State<CanvasEditor> createState() => _CanvasEditorState();
}

class _CanvasEditorState extends State<CanvasEditor> {
  static const int width = 32;
  static const int height = 32;

  late Uint8List buffer;
  ui.Image? image;

  final Color drawColor = Colors.blue;

  @override
  void initState() {
    super.initState();
    buffer = Uint8List(width * height * 4);
    for (int i = 0; i < buffer.length; i++) {
      buffer[i] = (Random().nextInt(32) * 255.0).round() & 0xff;
    }
    _setPixel(0, 0, Colors.pink);
    _setPixel(1, 1, Colors.pink);
    _setPixel(width - 1, height - 1, Colors.red);
    _updateImage();
  }

  void _setPixel(int x, int y, Color color) {
    if (x < 0 || x >= width || y < 0 || y >= height) return;

    final index = (y * width + x) * 4;
    buffer[index + 0] = (color.r * 255.0).round() & 0xff;
    buffer[index + 1] = (color.g * 255.0).round() & 0xff;
    buffer[index + 2] = (color.b * 255.0).round() & 0xff;
    buffer[index + 3] = (color.a * 255.0).round() & 0xff;

    _updateImage();
  }

  Future<void> _updateImage() async {
    ui.decodeImageFromPixels(buffer, width, height, ui.PixelFormat.rgba8888, (
      img,
    ) {
      setState(() => image = img);
    });
  }

  void _handleTapDown(TapDownDetails details) {
    final local = details.localPosition;
    final x = (local.dx.toInt());
    final y = (local.dy.toInt());
    _setPixel(x, y, drawColor);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 8,
      alignment: Alignment.center,
      child: GestureDetector(
        onTapDown: _handleTapDown,
        child: RawImage(
          image: image,
          scale: 1.0,
          filterQuality: FilterQuality.none,
          width: width.toDouble(),
          height: height.toDouble(),
        ),
      ),
    );
  }
}
