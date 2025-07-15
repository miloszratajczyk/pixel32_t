part of 'layers_panel_cubit.dart';

final class LayersPanelState extends Equatable {
  final List<ClothLayer> clothLayers;
  final int activeLayer;
  final int version;

  const LayersPanelState({
    required this.clothLayers,
    required this.activeLayer,
    this.version = 0,
  });

  LayersPanelState copyWith({List<ClothLayer>? clothLayers, int? activeLayer}) {
    return LayersPanelState(
      clothLayers: clothLayers ?? this.clothLayers,
      activeLayer: activeLayer ?? this.activeLayer,
      version: version + 1,
    );
  }

  @override
  List<Object> get props => [clothLayers, activeLayer, version];
}
