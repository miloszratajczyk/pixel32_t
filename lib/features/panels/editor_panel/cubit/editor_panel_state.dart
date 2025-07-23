part of 'editor_panel_cubit.dart';

final class EditorPanelState extends Equatable {
  final Offset offset;
  final int scale;

  const EditorPanelState({this.offset = Offset.zero, this.scale = 5});

  @override
  List<Object> get props => [offset, scale];

  EditorPanelState copyWith({Offset? offset, int? scale}) {
    return EditorPanelState(
      offset: offset ?? this.offset,
      scale: scale ?? this.scale,
    );
  }
}
