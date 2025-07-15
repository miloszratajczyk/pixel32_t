import 'package:flutter/widgets.dart';
import 'package:pixel32_t/features/tools/brush_tool/model/brush_tool.dart';

class BrushToolSettingsView extends StatelessWidget {
  const BrushToolSettingsView({required this.brushTool, super.key});

  final BrushTool brushTool;

  @override
  Widget build(BuildContext context) {
    return Text(brushTool.name);
  }
}
