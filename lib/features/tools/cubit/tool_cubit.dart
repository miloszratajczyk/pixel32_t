import 'package:bloc/bloc.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';
import 'package:pixel32_t/features/tools/core/application/tool_repository.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';

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
