import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:pixel32_t/features/cloth/model/cloth_layer.dart';
import 'package:pixel32_t/features/cloth/model/redraw_scheduler.dart';
import 'package:pixel32_t/features/core/model/v2i.dart';
import 'package:pixel32_t/features/selection_layer/selection_layer.dart';

class ClothRepository {
  ClothRepository() {
    previewLayer = ClothLayer(
      buffer: Uint8List(width * height * 4),
      isVisible: true,
    );

    selectionLayer = SelectionLayer(
      width: width,
      height: height,
      bitfield: Uint8List(((width * height) + 7) ~/ 8),
    );
    selectionLayer.selectAll();

    // Create a new white layer
    _layers.add(ClothLayer(buffer: Uint8List(width * height * 4)));
    final buffer = _layers[0].buffer;
    for (int i = 0; i < buffer.length; i++) {
      buffer[i] = 0xff;
    }

    _scheduler.requestRedraw();
  }

  final _imageController = StreamController<ui.Image>.broadcast();

  /// Stream yelding a new image every time it's regenerated
  Stream<ui.Image> get imageStream => _imageController.stream;

  // Makes sure the image is generated at a maximum of 60 fps
  late final _scheduler = RedrawScheduler(
    onRedraw: () async {
      final image = await _generateImage();
      _imageController.add(image);
    },
  );

  // Canvas
  int width = 128;
  int height = 128;

  // Layers
  final List<ClothLayer> _layers = [];
  UnmodifiableListView<ClothLayer> get layers => UnmodifiableListView(_layers);

  int _activeLayerIx = 0;

  /// Index of the active layer that is used for drawing
  get activeLayerIx => _activeLayerIx;
  ClothLayer get activeLayer => _layers[_activeLayerIx];

  late final ClothLayer previewLayer;
  late final SelectionLayer selectionLayer;

  /// Creates a new layer after the active layer and
  /// makes the new layer active
  void addLayer() {
    _layers.insert(
      _activeLayerIx + 1,
      ClothLayer(buffer: Uint8List(width * height * 4)),
    );
    selectLayer(_activeLayerIx + 1);
  }

  /// Makes the layer with given index active
  void selectLayer(int ix) {
    if (ix < 0 || ix >= _layers.length) return;
    _activeLayerIx = ix;
  }

  /// Replaces the layer with the provided new one
  void updateLayer(int ix, ClothLayer layer) {
    if (ix < 0 || ix >= _layers.length) return;
    _layers[ix] = layer;
  }

  /// Sets the RGBA color value of a given pixel in the preview layer
  void setPixel(V2i point, Color color, {bool checkSelection = true}) {
    if (point.x < 0 || point.x >= width || point.y < 0 || point.y >= height) {
      return;
    }
    if (checkSelection && !selectionLayer.at(point.x, point.y)) return;

    final buffer = previewLayer.buffer;
    final index = (point.y * width + point.x) * 4;
    buffer[index + 0] = (color.r * 255.0).round() & 0xff;
    buffer[index + 1] = (color.g * 255.0).round() & 0xff;
    buffer[index + 2] = (color.b * 255.0).round() & 0xff;
    buffer[index + 3] = (color.a * 255.0).round() & 0xff;
  }

  /// Returns color of a pixel from the current layer including opacity
  Color getPixel(V2i point) {
    if (point.x < 0 || point.x >= width || point.y < 0 || point.y >= height) {
      return Color(0x00000000);
    }

    final buffer = _layers[_activeLayerIx].buffer;
    final index = (point.y * width + point.x) * 4;

    return Color.fromRGBO(
      buffer[index + 0].round(),
      buffer[index + 1].round(),
      buffer[index + 2].round(),
      buffer[index + 3] / 255.0,
    );
  }

  /// Returns color of a pixel from the output image accounting for blending
  Future<Color> getImagePixel(V2i point) async {
    if (point.x < 0 || point.x >= width || point.y < 0 || point.y >= height) {
      return Color(0x00000000);
    }

    // Try to get the opaque color from last fully visible layer
    // to avoid generating the whole image
    // should happen most of the times
    final lastFullyVisibleLayer = _layers
        .where((e) => e.isVisible && e.opacity == 1.0)
        .lastOrNull;
    if (lastFullyVisibleLayer != null) {
      final buffer = lastFullyVisibleLayer.buffer;
      final index = (point.y * width + point.x) * 4;
      final color = Color.fromRGBO(
        buffer[index + 0].round(),
        buffer[index + 1].round(),
        buffer[index + 2].round(),
        buffer[index + 3] / 255.0,
      );
      if (color.a == 1.0) {
        return color;
      }
    }

    // The image is generated to take blending into account
    // if this proves too slow add functionality to generate only one pixel with blending
    final image = await _generateImage();
    final byteData = await image.toByteData(format: ui.ImageByteFormat.rawRgba);
    if (byteData == null) return Color(0x00000000);
    final index = (point.y * width + point.x) * 4;
    final buffer = byteData.buffer.asUint8List();
    return ui.Color.fromRGBO(
      buffer[index],
      buffer[index + 1],
      buffer[index + 2],
      buffer[index + 3] / 255.0,
    );
  }

  /// Set all RGBA values of a given pixel to 0
  void erasePixel(V2i point) {
    if (point.x < 0 || point.x >= width || point.y < 0 || point.y >= height) {
      return;
    }
    if (!selectionLayer.at(point.x, point.y)) return;

    final buffer = activeLayer.buffer;
    final index = (point.y * width + point.x) * 4;
    buffer[index + 0] = 0;
    buffer[index + 1] = 0;
    buffer[index + 2] = 0;
    buffer[index + 3] = 0;
  }

  /// Move image from the preview layer onto the active layer
  /// Generate layers' images if null, draw onto a canvas and
  /// save canvas bytedata to the active layer's buffer
  Future<void> _commitPreviewLayer() async {
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder);
    activeLayer.image ??= await _generateLayerImage(activeLayer);
    previewLayer.image ??= await _generateLayerImage(previewLayer);
    canvas.drawImage(activeLayer.image!, ui.Offset.zero, ui.Paint());
    canvas.drawImage(previewLayer.image!, ui.Offset.zero, ui.Paint());
    final image = await recorder.endRecording().toImage(width, height);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.rawRgba);
    if (byteData == null) return;
    activeLayer.buffer = byteData.buffer.asUint8List();
    previewLayer.hide();
    activeLayer.markForRedraw();
  }

  /// Request to geenrate a new output image
  /// If shouldCommit squash the preview layer ont the active layer
  void requestRedraw({bool shouldCommit = false}) async {
    if (shouldCommit) await _commitPreviewLayer();
    _scheduler.requestRedraw();
  }

  /// Creates a ui.Image of a single layer from buffer data
  Future<ui.Image> _generateLayerImage(ClothLayer layer) {
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

  /// Draws the output image based on layers' images,
  /// if some are null generates those as well
  Future<ui.Image> _generateImage() async {
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder);

    for (int i = 0; i < _layers.length; i++) {
      final layer = _layers[i];
      if (!layer.isVisible) continue;
      layer.image ??= await _generateLayerImage(layer);
      final paint = ui.Paint()
        ..blendMode = layer.blendMode
        ..color = ui.Color.fromARGB(
          (layer.opacity * 255).toInt(),
          255,
          255,
          255,
        );

      canvas.drawImage(layer.image!, Offset.zero, paint);
      if (i == activeLayerIx && previewLayer.isVisible) {
        previewLayer.image ??= await _generateLayerImage(previewLayer);
        canvas.drawImage(previewLayer.image!, Offset.zero, paint);
      }
    }

    final picture = recorder.endRecording();
    final composedImage = await picture.toImage(width, height);

    return composedImage;
  }

  void dispose() {
    _scheduler.dispose();
    _imageController.close();
  }

  /// Reorder the image layers
  void reorder(int oldIndex, int newIndex) {
    if (oldIndex == _activeLayerIx) {
      _activeLayerIx = newIndex;
    } else if (newIndex == _activeLayerIx) {
      _activeLayerIx = oldIndex;
    }
    if (newIndex > oldIndex) newIndex -= 1;

    final layer = _layers.removeAt(oldIndex);
    _layers.insert(newIndex, layer);
  }
}
