part of 'cloth_cubit.dart';

@freezed
class ClothState with _$ClothState {
  // Colors
  @override
  final Color primaryColor;
  @override
  final Color secondaryColor;
  @override
  final Set<Color> colorPalette;
  // Layers
  @override
  final List<ClothLayer> layers;
  @override
  final int activeLayer;
  // Other
  @override
  final ui.Image? image;

  // Whole equality is based on this value only
  @override
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
}
