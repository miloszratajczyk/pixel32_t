import 'dart:async';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:pixel32_t/features/cloth/application/cloth_repository.dart';
import 'package:pixel32_t/features/cloth/model/cloth_layer.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';

part 'cloth_state.dart';

class ClothCubit extends Cubit<ClothState> {
  final ClothRepository repo;
  late final StreamSubscription<ui.Image> _sub;

  ClothCubit(this.repo)
    : super(
        ClothState(
          primaryColor: repo.primaryColor,
          secondaryColor: repo.secondaryColor,
          colorPalette: repo.colorPalette,
          layers: repo.clothLayers,
          activeTool: repo.activeTool,
          activeLayer: repo.activeLayer,
          version: 0,
        ),
      ) {
    _sub = repo.imageStream.listen((image) {
      emit(state.copyWith(image: image));
    });
  }

  // Colors

  void setPrimaryColor(Color color) {
    repo.primaryColor = color;
    emit(state.copyWith(primaryColor: color));
  }

  void setSecondaryColor(Color color) {
    repo.secondaryColor = color;
    emit(state.copyWith(secondaryColor: color));
  }

  void savePrimaryColor() {
    final newColorPalette = state.colorPalette..add(state.primaryColor);
    emit(state.copyWith(colorPalette: newColorPalette));
  }

  void saveSecondaryColor() {
    final newColorPalette = state.colorPalette..add(state.secondaryColor);
    emit(state.copyWith(colorPalette: newColorPalette));
  }

  // Tools

  void selectTool(Tool tool) {
    repo.activeTool = tool;
    emit(state.copyWith(activeTool: tool));
  }

  List<Tool> getTools() {
    return repo.tools;
  }

  // Layers

  void selectLayer(int index) {
    repo.selectActiveLayer(index);
    emit(state.copyWith(activeLayer: index));
  }

  List<ClothLayer> getLayers() {
    return repo.clothLayers;
  }

  void addLayer() {
    repo.addLayer();
    emit(state.copyWith(layers: repo.clothLayers));
  }

  void toggleVisibility(int ix) {
    repo.clothLayers[ix].visible = !repo.clothLayers[ix].visible;
    emit(state.copyWith(layers: List.unmodifiable(repo.clothLayers)));
    repo.requestRedraw();
  }

  // Editor

  void pointerDown(PointerDownEvent pointerEvent, BuildContext context) {
    state.activeTool.onPointerDown(pointerEvent, repo, context);
    repo.requestRedraw();
  }

  void pointerMove(PointerMoveEvent pointerEvent, BuildContext context) {
    state.activeTool.onPointerMove(pointerEvent, repo, context);
    repo.requestRedraw();
  }

  void pointerUp(PointerUpEvent pointerEvent, BuildContext context) {
    state.activeTool.onPointerUp(pointerEvent, repo, context);
    repo.requestRedraw();
  }

  void pointerSignal(PointerSignalEvent pointerEvent, BuildContext context) {
    state.activeTool.onPointerSignal(pointerEvent, repo, context);
    repo.requestRedraw();
  }
}
