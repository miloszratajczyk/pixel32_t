import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';
import 'package:pixel32_t/features/tools/core/repo/tool_repository.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';

class ToolCubit extends Cubit<Tool> {
  ToolCubit(ToolRepository toolRepository)
    : _toolRepository = toolRepository,
      super(toolRepository.tools.first);

  final ToolRepository _toolRepository;
  // Tools

  void selectTool(Tool tool) {
    _toolRepository.selectTool(tool);
    emit(_toolRepository.currentTool);
  }

  void updateTool(Tool tool) {
    _toolRepository.updateTool(tool);
    emit(_toolRepository.currentTool);
  }

  List<Tool> getTools() {
    return _toolRepository.tools;
  }
}
