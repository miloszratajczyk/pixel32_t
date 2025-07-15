part of 'canvas_editor_bloc.dart';

final class CanvasEditorState extends Equatable {
  final int width;
  final int height;
  final List<Uint8List> layers;
  final ui.Image? image;

  const CanvasEditorState({
    required this.width,
    required this.height,
    required this.layers,
    this.image,
  });

  @override
  List<Object?> get props => [width, height, image, List.of(layers)];

  CanvasEditorState copyWith({
    int? width,
    int? height,
    List<Uint8List>? layers,
    ui.Image? image,
  }) {
    return CanvasEditorState(
      width: width ?? this.width,
      height: height ?? this.height,
      image: image ?? this.image,
      layers: layers ?? this.layers,
    );
  }
}
