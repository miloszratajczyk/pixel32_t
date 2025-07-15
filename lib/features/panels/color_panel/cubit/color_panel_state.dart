part of 'color_panel_cubit.dart';

final class ColorPanelState extends Equatable {
  final Color primaryColor;
  final Color secondaryColor;
  final Set<Color> colorPalette;

  const ColorPanelState({
    required this.primaryColor,
    required this.secondaryColor,
    required this.colorPalette,
  });

  ColorPanelState copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Set<Color>? colorPalette,
  }) {
    return ColorPanelState(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      colorPalette: colorPalette ?? this.colorPalette,
    );
  }

  @override
  List<Object> get props => [primaryColor, secondaryColor, colorPalette];
}
