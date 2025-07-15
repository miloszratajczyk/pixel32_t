import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pixel32_t/features/tools/fill_tool/model/fill_tool.dart';
import 'package:pixel32_t/features/tools/pencil_tool/model/pencil_tool.dart';

class FillToolSettingsView extends StatelessWidget {
  const FillToolSettingsView({required this.fillTool, super.key});

  final FillTool fillTool;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(fillTool.name),
        Slider(
          value: fillTool.tolerance.toDouble(),
          min: 0,
          max: 255,
          divisions: 255,
          label: fillTool.tolerance.toString(),
          onChanged: (value) {
            fillTool.tolerance = value.toInt();
          },
        ),
      ],
    );
  }
}
