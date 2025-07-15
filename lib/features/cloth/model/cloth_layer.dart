import 'dart:typed_data' show Uint8List;
import 'dart:ui' as ui;

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class ClothLayer extends Equatable {
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

  @override
  List<Object?> get props => [buffer, visible, opacity, blendMode, image];
}
