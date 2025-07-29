import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/tools/brush_tool/model/brush_tool.dart';
import 'package:pixel32_t/features/tools/cubit/tool_cubit.dart';

class BrushToolSettingsView extends StatelessWidget {
  const BrushToolSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final state = context.watch<ToolCubit>().state;
        if (state is BrushTool) {
          final tool = state;
          return Column(
            children: [
              Text(tool.name),

              // TODO Handle max radius
              Text(tool.radius.toStringAsFixed(2)),
              Slider(
                value: tool.radius.toDouble(),
                min: 0,
                max: 32,
                // divisions: 32,
                label: tool.radius.toString(),
                onChanged: (value) {
                  context.read<ToolCubit>().updateTool(
                    tool.copyWith(radius: value),
                  );
                },
              ),
            ],
          );
        }
        return Text("Invalid state");
      },
    );
  }
}
