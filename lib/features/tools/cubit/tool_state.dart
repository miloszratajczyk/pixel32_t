part of 'tool_cubit.dart';

sealed class ToolState extends Equatable {
  const ToolState();

  @override
  List<Object> get props => [];
}

final class ToolInitial extends ToolState {}
