import 'package:flutter/widgets.dart';
import 'package:pixel32_t/features/tools/pencil_tool/model/pencil_tool.dart';
import 'package:pixel32_t/features/tools/zoom_tool/model/zoom_tool.dart';

class ZoomToolSettingsView extends StatelessWidget {
  const ZoomToolSettingsView({required this.zoomTool, super.key});

  final ZoomTool zoomTool;

  @override
  Widget build(BuildContext context) {
    return Text(zoomTool.name);
  }
}
