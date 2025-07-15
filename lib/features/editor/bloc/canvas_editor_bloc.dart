import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'canvas_editor_event.dart';
part 'canvas_editor_state.dart';

class CanvasEditorBloc extends Bloc<CanvasEditorEvent, CanvasEditorState> {
  CanvasEditorBloc()
    : super(CanvasEditorState(width: 256, height: 128, layers: [])) {
    on<CanvasEditorEvent>((event, emit) {
      on<CanvasEditorStarted>(_onInitialize);
      on<CanvasEditorPixelSet>(_onSetPixel);

      add(CanvasEditorStarted());
    });
  }

  Future<void> _onInitialize(
    CanvasEditorStarted event,
    Emitter<CanvasEditorState> emit,
  ) async {
    final buffer = Uint8List(state.width * state.height * 4);
    final rand = Random();
    for (int i = 0; i < buffer.length; i++) {
      buffer[i] = (rand.nextInt(32) * 255.0).round() & 0xff;
    }

    _setPixelInBuffer(buffer, 0, 0, Colors.pink);
    _setPixelInBuffer(buffer, 1, 1, Colors.pink);
    _setPixelInBuffer(buffer, state.width - 1, state.height - 1, Colors.red);

    final image = await _generateImage(buffer);
    emit(
      CanvasEditorState(
        width: state.width,
        height: state.height,
        layers: [buffer],
        image: image,
      ),
    );
  }

  Future<void> _onSetPixel(
    CanvasEditorPixelSet event,
    Emitter<CanvasEditorState> emit,
  ) async {
    final buffer = Uint8List.fromList(state.layers.first);
    _setPixelInBuffer(buffer, event.x, event.y, event.color);
    final image = await _generateImage(buffer);
    emit(
      CanvasEditorState(
        width: state.width,
        height: state.height,
        layers: [buffer],
        image: image,
      ),
    );
  }

  void _setPixelInBuffer(Uint8List buffer, int x, int y, Color color) {
    if (x < 0 || x >= state.width || y < 0 || y >= state.height) return;

    final index = (y * state.width + x) * 4;
    buffer[index + 0] = (color.r * 255.0).round() & 0xff;
    buffer[index + 1] = (color.g * 255.0).round() & 0xff;
    buffer[index + 2] = (color.b * 255.0).round() & 0xff;
    buffer[index + 3] = (color.a * 255.0).round() & 0xff;
  }

  Future<ui.Image> _generateImage(Uint8List buffer) async {
    final completer = Completer<ui.Image>();
    ui.decodeImageFromPixels(
      buffer,
      state.width,
      state.height,
      ui.PixelFormat.rgba8888,
      (ui.Image img) {
        completer.complete(img);
      },
    );
    return completer.future;
  }
}
