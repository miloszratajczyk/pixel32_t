import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixel32_t/features/cloth/model/cloth_layer.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';

part 'layers_panel_state.dart';
part 'layers_panel_cubit.freezed.dart';

class LayersPanelCubit extends Cubit<LayersPanelState> {
  LayersPanelCubit(ClothRepository clothRepository)
    : _clothRepository = clothRepository,
      super(
        LayersPanelState(
          layers: clothRepository.layers,
          activeLayerIx: clothRepository.activeLayerIx,
        ),
      );
  final ClothRepository _clothRepository;

  /// Sets the active layer index to provided `ix`
  void selectLayer(int ix) {
    _clothRepository.selectLayer(ix);
    emit(state.copyWith(activeLayerIx: _clothRepository.activeLayerIx));
  }

  /// Create a new layer in `ClothRepository` and update state
  void addLayer() {
    _clothRepository.addLayer();
    emit(
      state.copyWith(
        layers: _clothRepository.layers,
        activeLayerIx: _clothRepository.activeLayerIx,
        version: state.version + 1,
      ),
    );
  }

  /// Toggles the visibility of the layer at index `ix` and redraws the image
  void toggleVisibility(int ix) {
    final isVisible = state.layers[ix].isVisible;
    _clothRepository.updateLayer(
      ix,
      state.layers[ix].copyWith(isVisible: !isVisible),
    );
    _clothRepository.requestRedraw();
    emit(
      state.copyWith(
        layers: _clothRepository.layers,
        version: state.version + 1,
      ),
    );
  }

  /// Replaces the layer at index `ix` with provided `layer` and redraws the image
  void updateLayer(int ix, ClothLayer layer) {
    _clothRepository.updateLayer(ix, layer);
    _clothRepository.requestRedraw();
    emit(
      state.copyWith(
        layers: _clothRepository.layers,
        version: state.version + 1,
      ),
    );
  }

  /// Reorders `ClothRepository` layers, redraws the image and updates state
  void reorder(int oldIndex, int newIndex) {
    _clothRepository.reorder(oldIndex, newIndex);
    _clothRepository.requestRedraw();
    emit(
      state.copyWith(
        layers: _clothRepository.layers,
        activeLayerIx: _clothRepository.activeLayerIx,
        version: state.version + 1,
      ),
    );
  }
}
