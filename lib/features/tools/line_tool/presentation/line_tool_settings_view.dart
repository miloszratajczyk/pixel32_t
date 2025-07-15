import 'package:flutter/widgets.dart';
import 'package:pixel32_t/features/tools/line_tool/model/line_tool.dart';

class LineToolSettingsView extends StatelessWidget {
  const LineToolSettingsView({required this.lineTool, super.key});

  final LineTool lineTool;

  @override
  Widget build(BuildContext context) {
    return Text(lineTool.name);
  }
}
