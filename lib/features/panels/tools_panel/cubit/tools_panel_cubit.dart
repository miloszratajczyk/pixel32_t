import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:pixel32_t/features/cloth/application/cloth_repository.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';

class ToolsPanelCubit extends Cubit<Tool> {
  ClothRepository clothRepository;
  ToolsPanelCubit(this.clothRepository) : super(clothRepository.activeTool);

  List<Tool> getToolsList() => clothRepository.tools;

  void selectTool(Tool tool) {
    clothRepository.activeTool = tool;
    emit(tool);
  }
}
