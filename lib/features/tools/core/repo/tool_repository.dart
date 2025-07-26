import 'dart:collection';

import 'package:pixel32_t/features/tools/brush_tool/model/brush_tool.dart';
import 'package:pixel32_t/features/tools/circle_tool/model/circle_tool.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';
import 'package:pixel32_t/features/tools/eraser_tool/model/eraser_tool.dart';
import 'package:pixel32_t/features/tools/fill_tool/model/fill_tool.dart';
import 'package:pixel32_t/features/tools/line_tool/model/line_tool.dart';
import 'package:pixel32_t/features/tools/pencil_tool/model/pencil_tool.dart';
import 'package:pixel32_t/features/tools/rectangle_select_tool/model/rectangle_select_tool.dart';
import 'package:pixel32_t/features/tools/rectangle_tool/model/rectangle_tool.dart';
import 'package:pixel32_t/features/tools/zoom_tool/model/zoom_tool.dart';

class ToolRepository {
  final List<Tool> _tools = [
    PencilTool(),
    BrushTool(),
    EraserTool(),
    LineTool(),
    FillTool(),
    ZoomTool(),
    RectangleTool(),
    RectangleSelectTool(),
    CircleTool(),
  ];

  int _currentToolIx = 0;

  Tool get currentTool => _tools[_currentToolIx];

  void selectTool(Tool tool) {
    final ix = _tools.indexOf(tool);
    _currentToolIx = ix == -1 ? 0 : ix;
  }

  void updateTool(Tool tool) {
    _tools[_currentToolIx] = tool;
  }

  UnmodifiableListView<Tool> get tools => UnmodifiableListView(_tools);
}
