import 'package:pixel32_t/features/tools/brush_tool/model/brush_tool.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';
import 'package:pixel32_t/features/tools/eraser_tool/model/eraser_tool.dart';
import 'package:pixel32_t/features/tools/fill_tool/model/fill_tool.dart';
import 'package:pixel32_t/features/tools/line_tool/model/line_tool.dart';
import 'package:pixel32_t/features/tools/pencil_tool/model/pencil_tool.dart';
import 'package:pixel32_t/features/tools/rectangle_select_tool/model/rectangle_select_tool.dart';
import 'package:pixel32_t/features/tools/rectangle_tool/model/rectangle_tool.dart';
import 'package:pixel32_t/features/tools/zoom_tool/model/zoom_tool.dart';

class ToolRepository {
  final List<Tool> tools = [
    PencilTool(),
    BrushTool(),
    EraserTool(),
    LineTool(),
    FillTool(),
    ZoomTool(),
    RectangleTool(),
    RectangleSelectTool(),
  ];

  // TODO save and load tool settings
}
