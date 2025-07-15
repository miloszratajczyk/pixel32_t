part of 'editor_panel_bloc.dart';

final class EditorPanelState extends Equatable {
  final ui.Image? image;

  //TODO Maybe remove ix
  final int ix;
  const EditorPanelState(this.image, [this.ix = 0]);

  @override
  List<Object?> get props => [image, ix];
}
