import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:pixel32_t/features/cloth/application/redraw_scheduler.dart';
import 'package:pixel32_t/features/cloth/model/cloth_layer.dart';
import 'package:pixel32_t/features/tools/brush_tool/model/brush_tool.dart';
import 'package:pixel32_t/features/tools/eraser_tool/model/eraser_tool.dart';
import 'package:pixel32_t/features/tools/fill_tool/model/fill_tool.dart';
import 'package:pixel32_t/features/tools/line_tool/model/line_tool.dart';
import 'package:pixel32_t/features/tools/pencil_tool/model/pencil_tool.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';
import 'package:pixel32_t/features/tools/zoom_tool/model/zoom_tool.dart';

class ClothRepository {
  final _imageController = StreamController<ui.Image>.broadcast();
  Stream<ui.Image> get imageStream => _imageController.stream;

  // Makes sure the image is generated at a maximum of 60 fps
  late final _scheduler = RedrawScheduler(
    onRedraw: () async {
      final image = await generateImage();
      _imageController.add(image);
    },
  );

  ClothRepository() {
    previewLayer = ClothLayer(
      buffer: Uint8List(width * height * 4),
      visible: false,
    );

    addLayer();
    // Temp fill with random color
    final buffer = clothLayers[0].buffer;
    for (int i = 0; i < buffer.length; i++) {
      buffer[i] = (Random().nextInt(32) * 255.0).round() & 0xff;
    }

    requestRedraw();
  }

  // Canvas
  int width = 128;
  int height = 128;

  // Layers
  final List<ClothLayer> clothLayers = [];
  int activeLayer = 0;
  late ClothLayer previewLayer;

  // Colors
  Color primaryColor = Color(0xff000000);
  Color secondaryColor = Color(0xffffffff);
  Set<Color> colorPalette = {};

  // Tools
  final List<Tool> tools = [
    PencilTool(),
    BrushTool(),
    EraserTool(),
    LineTool(),
    FillTool(),
    ZoomTool(),
  ];
  late Tool activeTool = tools.first;

  void addLayer() {
    clothLayers.add(ClothLayer(buffer: Uint8List(width * height * 4)));
  }

  void selectActiveLayer(int ix) {
    if (ix < 0 || ix >= clothLayers.length) return;
    activeLayer = ix;
  }

  void markLayerForRedraw() {
    clothLayers[activeLayer].image = null;
  }

  // TODO deprecate xd
  void setPixel(Point<int> point) {
    if (point.x < 0 || point.x >= width || point.y < 0 || point.y >= height) {
      return;
    }

    final buffer = clothLayers[activeLayer].buffer;
    final index = (point.y * width + point.x) * 4;
    buffer[index + 0] = (primaryColor.r * 255.0).round() & 0xff;
    buffer[index + 1] = (primaryColor.g * 255.0).round() & 0xff;
    buffer[index + 2] = (primaryColor.b * 255.0).round() & 0xff;
    buffer[index + 3] = (primaryColor.a * 255.0).round() & 0xff;
  }

  void drawPixel(ClothLayer layer, Point<int> point, Color color) {
    if (point.x < 0 || point.x >= width || point.y < 0 || point.y >= height) {
      return;
    }

    final buffer = layer.buffer;
    final index = (point.y * width + point.x) * 4;

    buffer[index + 0] = (color.r * 255.0).round() & 0xff;
    buffer[index + 1] = (color.g * 255.0).round() & 0xff;
    buffer[index + 2] = (color.b * 255.0).round() & 0xff;
    buffer[index + 3] = (color.a * 255.0).round() & 0xff;
  }

  Color getPixel(Point<int> point) {
    if (point.x < 0 || point.x >= width || point.y < 0 || point.y >= height) {
      return Color(0x00000000);
    }

    final buffer = clothLayers[activeLayer].buffer;
    final index = (point.y * width + point.x) * 4;

    return Color.fromRGBO(
      buffer[index + 0].round(),
      buffer[index + 1].round(),
      buffer[index + 2].round(),
      buffer[index + 3] / 255.0,
    );
  }

  void drawPixelPrimary(Point<int> point) {
    drawPixel(clothLayers[activeLayer], point, primaryColor);
  }

  void drawPixelSecondary(Point<int> point) {
    drawPixel(clothLayers[activeLayer], point, secondaryColor);
  }

  void erasePixel(Point<int> point) {
    drawPixel(clothLayers[activeLayer], point, Color(0x00000000));
  }

  void drawPixelPrimaryPreview(Point<int> point) {
    drawPixel(previewLayer, point, primaryColor);
  }

  void drawPixelSecondaryPreview(Point<int> point) {
    drawPixel(previewLayer, point, secondaryColor);
  }

  void requestRedraw() {
    _scheduler.requestRedraw();
  }

  void flushLayerPreview() {
    previewLayer.image = null;
    previewLayer.buffer = Uint8List(width * height * 4);
  }

  Future<ui.Image> generateImageForLayer(ClothLayer layer) {
    final completer = Completer<ui.Image>();
    ui.decodeImageFromPixels(
      layer.buffer,
      width,
      height,
      ui.PixelFormat.rgba8888,
      (ui.Image img) {
        completer.complete(img);
      },
    );
    return completer.future;
  }

  Future<ui.Image> generateImage() async {
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder);

    for (final layer in clothLayers) {
      if (!layer.visible) continue;
      layer.image ??= await generateImageForLayer(layer);

      final paint = ui.Paint()..blendMode = layer.blendMode;
      canvas.drawImage(layer.image!, Offset.zero, paint);
    }

    if (previewLayer.visible) {
      previewLayer.image ??= await generateImageForLayer(previewLayer);
      canvas.drawImage(previewLayer.image!, Offset.zero, ui.Paint());
    }

    final picture = recorder.endRecording();
    final composedImage = await picture.toImage(width, height);
    return composedImage;
  }

  void dispose() {
    _scheduler.dispose();
    _imageController.close();
  }
}
