import 'dart:async';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixel32_t/features/cloth/model/cloth_layer.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';

part 'cloth_state.dart';
part 'cloth_cubit.freezed.dart';

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
}
