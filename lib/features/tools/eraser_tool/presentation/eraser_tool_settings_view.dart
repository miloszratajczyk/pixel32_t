import 'package:flutter/widgets.dart';
import 'package:pixel32_t/features/tools/eraser_tool/model/eraser_tool.dart';

class EraserToolSettingsView extends StatelessWidget {
  const EraserToolSettingsView({required this.eraserTool, super.key});

  final EraserTool eraserTool;

  @override
  Widget build(BuildContext context) {
    return Text(eraserTool.name);
  }
}
