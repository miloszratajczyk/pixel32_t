part of 'editor_panel_bloc.dart';

sealed class EditorPanelEvent extends Equatable {
  const EditorPanelEvent();

  @override
  List<Object> get props => [];
}

final class EditorPanelRedrawTicked extends EditorPanelEvent {}

final class EditorPanelPixelSet extends EditorPanelEvent {
  final int x, y;
  const EditorPanelPixelSet(this.x, this.y);

  @override
  List<Object> get props => [x, y];
}

final class EditorPanelRefreshRequested extends EditorPanelEvent {}

class EditorPanelImageUpdated extends EditorPanelEvent {
  final ui.Image image;

  const EditorPanelImageUpdated(this.image);

  @override
  List<Object> get props => [image];
}

abstract final class EditorPanelPointerEvent extends EditorPanelEvent {
  final PointerEvent pointerEvent;
  const EditorPanelPointerEvent(this.pointerEvent);

  @override
  List<Object> get props => [pointerEvent];
}

final class EditorPanelPointerDown extends EditorPanelPointerEvent {
  const EditorPanelPointerDown(super.pointerEvent);
}

final class EditorPanelPointerMove extends EditorPanelPointerEvent {
  const EditorPanelPointerMove(super.pointerEvent);
}

final class EditorPanelPointerUp extends EditorPanelPointerEvent {
  const EditorPanelPointerUp(super.pointerEvent);
}

final class EditorPanelPointerSignal extends EditorPanelPointerEvent {
  const EditorPanelPointerSignal(super.pointerEvent);
}
