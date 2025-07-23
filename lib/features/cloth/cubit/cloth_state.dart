part of 'cloth_cubit.dart';

final class ClothState extends Equatable {
  // Colors
  final Color primaryColor;
  final Color secondaryColor;
  final Set<Color> colorPalette;
  // Layers
  final List<ClothLayer> layers;
  final int activeLayer;
  // Other
  final ui.Image? image;

  // Whole equality is based on this value only
  final int version;

  const ClothState({
    required this.primaryColor,
    required this.secondaryColor,
    required this.colorPalette,
    required this.layers,
    required this.activeLayer,
    this.image,
    required this.version,
  });

  ClothState copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Set<Color>? colorPalette,
    List<ClothLayer>? layers,
    int? activeLayer,
    Tool? activeTool,
    ui.Image? image,
  }) {
    return ClothState(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      colorPalette: colorPalette ?? this.colorPalette,
      layers: layers ?? this.layers,
      activeLayer: activeLayer ?? this.activeLayer,
      image: image ?? this.image,
      version: version + 1,
    );
  }

  @override
  List<Object> get props => [version];
}
