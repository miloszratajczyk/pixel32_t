import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixel32_t/features/tools/core/repo/tool_repository.dart';

part 'tool_state.dart';
part 'tool_state_extensions.dart';
part 'tool_cubit.freezed.dart';

class ToolCubit extends Cubit<ToolState> {
  ToolCubit(ToolRepository toolRepository)
    : _toolRepository = toolRepository,
      super(ToolState.pencil());

  ToolRepository _toolRepository;

  // void selectTool(String toolName) {

  // }

  // void updateTool(ToolState state) {
  //   emit(state);
  // }

  // List<Tool> getTools() {
  //   return repo.tools;
  // }
}
