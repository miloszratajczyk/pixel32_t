import 'dart:typed_data' show Uint8List;
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';

class ClothLayer {
  Uint8List buffer;
  bool visible;
  double opacity;
  BlendMode blendMode;
  ui.Image? image;
  ClothLayer({
    required this.buffer,
    this.visible = true,
    this.opacity = 1.0,
    this.blendMode = BlendMode.srcOver,
  });
}
