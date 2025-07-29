part of 'editor_panel_cubit.dart';

@freezed
abstract class EditorPanelState with _$EditorPanelState {
  const factory EditorPanelState({
    @Default(Offset.zero) Offset offset,
    @Default(5) int scale,
    @Default(true) bool shouldHandleScroll,
  }) = _EditorPanelState;
}
