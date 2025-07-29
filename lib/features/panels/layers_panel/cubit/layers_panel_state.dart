part of 'layers_panel_cubit.dart';

@freezed
abstract class LayersPanelState with _$LayersPanelState {
  const factory LayersPanelState({
    required UnmodifiableListView<ClothLayer> layers,
    required int activeLayerIx,
    // Used for state rebuilding equality TODO optimize
    @Default(0) int version,
  }) = _LayersPanelState;
}
