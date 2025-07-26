part of 'editor_panel_cubit.dart';

@freezed
class EditorPanelState with _$EditorPanelState {
  @override
  final Offset offset;
  @override
  final int scale;

  const EditorPanelState({this.offset = Offset.zero, this.scale = 5});
}
