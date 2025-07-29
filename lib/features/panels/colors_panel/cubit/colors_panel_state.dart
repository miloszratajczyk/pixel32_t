part of 'colors_panel_cubit.dart';

@freezed
abstract class ColorsPanelState with _$ColorsPanelState {
  const factory ColorsPanelState({
    required Color primaryColor,
    required Color secondaryColor,
    required UnmodifiableListView<Color> colorPalette,
  }) = _ColorsPanelState;
}
