part of 'tool_cubit.dart';

extension ToolStateExtensions on ToolState {
  String get name => switch (this) {
    Pencil() => "Pencil",
    Brush() => "Brush",
    Fill() => "Fill",
    Rectangle() => "Rectangle",
    Circle() => "Circle",
  };

  String get icon => switch (this) {
    Pencil() => "assets/icons/pencil.svg",
    Brush() => "assets/icons/brush.svg",
    Fill() => "assets/icons/fill.svg",
    Rectangle() => "assets/icons/rectangle.svg",
    Circle() => "assets/icons/circle.svg",
  };
}
