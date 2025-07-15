import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pixel32_t/features/cloth/model/cloth_layer.dart';
import 'package:pixel32_t/features/cloth/application/cloth_repository.dart';

part 'layers_panel_state.dart';

class LayersPanelCubit extends Cubit<LayersPanelState> {
  ClothRepository clothRepository;
  LayersPanelCubit(this.clothRepository)
    : super(
        LayersPanelState(
          clothLayers: clothRepository.clothLayers,
          activeLayer: clothRepository.activeLayer,
        ),
      );

  void addLayer() {
    clothRepository.addLayer();
    emit(
      state.copyWith(
        clothLayers: List.unmodifiable(clothRepository.clothLayers),
      ),
    );
  }

  void selectActiveLayer(int ix) {
    clothRepository.selectActiveLayer(ix);
    emit(state.copyWith(activeLayer: ix));
  }

  void toggleVisibility(int ix) {
    clothRepository.clothLayers[ix].visible =
        !clothRepository.clothLayers[ix].visible;
    emit(
      state.copyWith(
        clothLayers: List.unmodifiable(clothRepository.clothLayers),
      ),
    );
    clothRepository.requestRedraw();
  }
}
