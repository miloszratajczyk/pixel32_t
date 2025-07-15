part of 'canvas_editor_bloc.dart';

sealed class CanvasEditorEvent extends Equatable {
  const CanvasEditorEvent();

  @override
  List<Object> get props => [];
}

final class CanvasEditorStarted extends CanvasEditorEvent {
  const CanvasEditorStarted();

  @override
  List<Object> get props => [];
}

final class CanvasEditorPixelSet extends CanvasEditorEvent {
  final int x, y;
  final Color color;

  const CanvasEditorPixelSet(this.x, this.y, this.color);

  @override
  List<Object> get props => [x, y, color];
}
