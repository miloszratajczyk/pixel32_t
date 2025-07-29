import 'dart:collection';
import 'dart:ui';

import 'package:pixel32_t/features/tools/brush_tool/model/brush_tool.dart';
import 'package:pixel32_t/features/tools/circle_select_tool/model/circle_select_tool.dart';
import 'package:pixel32_t/features/tools/circle_tool/model/circle_tool.dart';
import 'package:pixel32_t/features/tools/color_picker_tool/model/color_picker_tool.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';
import 'package:pixel32_t/features/tools/eraser_tool/model/eraser_tool.dart';
import 'package:pixel32_t/features/tools/fill_tool/model/fill_tool.dart';
import 'package:pixel32_t/features/tools/hand_tool/model/hand_tool.dart';
import 'package:pixel32_t/features/tools/lasso_select_tool/model/lasso_select_tool.dart';
import 'package:pixel32_t/features/tools/lasso_tool/model/lasso_tool.dart';
import 'package:pixel32_t/features/tools/pencil_tool/model/pencil_tool.dart';
import 'package:pixel32_t/features/tools/polygon_select_tool/model/polygon_select_tool.dart';
import 'package:pixel32_t/features/tools/rectangle_select_tool/model/rectangle_select_tool.dart';
import 'package:pixel32_t/features/tools/rectangle_tool/model/rectangle_tool.dart';
import 'package:pixel32_t/features/tools/wand_tool/model/wand_tool.dart';

class ToolRepository {
  // Tools
  final List<Tool> _tools = [
    ColorPickerTool(),
    PencilTool(),
    EraserTool(),
    BrushTool(),
    WandTool(),
    FillTool(),
    RectangleSelectTool(),
    RectangleTool(),
    CircleSelectTool(),
    CircleTool(),
    LassoSelectTool(),
    LassoTool(),
    PolygonSelectTool(),
    // PlygonTool(),
    // MoveTool(),
    HandTool(),
  ];

  // Colors
  Color primaryColor = Color(0xff000000);
  Color secondaryColor = Color(0xffffffff);
  List<Color> _colorPalette = [];

  // Tools methods

  int _currentToolIx = 1;

  Tool get currentTool => _tools[_currentToolIx];

  void selectTool(Tool tool) {
    final ix = _tools.indexOf(tool);
    _currentToolIx = ix == -1 ? 0 : ix;
  }

  void updateTool(Tool tool) {
    _tools[_currentToolIx] = tool;
  }

  UnmodifiableListView<Tool> get tools => UnmodifiableListView(_tools);

  // Colors methods
  UnmodifiableListView<Color> get colorPalette =>
      UnmodifiableListView(_colorPalette);
  set colorPalette(List<Color> palette) {
    _colorPalette = palette;
  }
}
