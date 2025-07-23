import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pixel32_t/features/cloth/application/cloth_repository.dart';
import 'package:pixel32_t/features/tools/core/application/tool_repository.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';
part 'tool_state.dart';

class ToolCubit extends Cubit<Tool> {
  ToolRepository repo;
  ToolCubit(this.repo) : super(repo.tools.first);

  // Tools

  void selectTool(Tool tool) {
    emit(tool);
  }

  void updateTool(Tool tool) {
    final toolIx = repo.tools.indexOf(state);
    repo.tools[toolIx] = tool;
    emit(tool);
  }

  List<Tool> getTools() {
    return repo.tools;
  }
}
