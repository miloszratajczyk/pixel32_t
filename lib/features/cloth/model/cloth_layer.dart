import 'dart:typed_data' show Uint8List;
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloth_layer.freezed.dart';

@freezed
class ClothLayer with _$ClothLayer {
  ClothLayer({
    required this.buffer,
    this.isVisible = true,
    this.opacity = 1.0,
    this.blendMode = BlendMode.srcOver,
  });

  UniqueKey id = UniqueKey();
  @override
  Uint8List buffer;
  @override
  bool isVisible;
  @override
  double opacity;
  @override
  BlendMode blendMode;
  @override
  ui.Image? image;

  void markForRedraw() {
    image = null;
  }

  void flush() {
    buffer.fillRange(0, buffer.length, 0);
  }

  void show() {
    isVisible = true;
  }

  void hide() {
    isVisible = false;
  }
}
