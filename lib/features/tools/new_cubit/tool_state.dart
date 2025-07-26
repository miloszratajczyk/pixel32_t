part of 'tool_cubit.dart';

@freezed
sealed class ToolState with _$ToolState {
  const factory ToolState.pencil() = Pencil;
  const factory ToolState.brush() = Brush;
  const factory ToolState.fill() = Fill;
  const factory ToolState.rectangle(bool shouldFill) = Rectangle;
  const factory ToolState.circle(bool shouldFill) = Circle;
}
