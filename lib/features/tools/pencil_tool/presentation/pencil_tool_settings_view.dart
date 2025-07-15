import 'package:flutter/widgets.dart';
import 'package:pixel32_t/features/tools/pencil_tool/model/pencil_tool.dart';

class PencilToolSettingsView extends StatelessWidget {
  const PencilToolSettingsView({required this.pencilTool, super.key});

  final PencilTool pencilTool;

  @override
  Widget build(BuildContext context) {
    return Text(pencilTool.name);
  }
}
