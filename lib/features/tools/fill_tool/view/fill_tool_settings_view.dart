import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/tools/cubit/tool_cubit.dart';
import 'package:pixel32_t/features/tools/fill_tool/model/fill_tool.dart';

class FillToolSettingsView extends StatelessWidget {
  const FillToolSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final state = context.watch<ToolCubit>().state;
        if (state is FillTool) {
          final tool = state;
          return Column(
            children: [
              Text(tool.name),

              Text(tool.tolerance.toStringAsFixed(2)),
              Slider(
                value: tool.tolerance.toDouble(),
                min: 0,
                max: 1,
                divisions: 255,
                label: tool.tolerance.toStringAsFixed(2),
                onChanged: (value) {
                  context.read<ToolCubit>().updateTool(
                    tool.copyWith(tolerance: value),
                  );
                },
              ),
              Switch(
                value: state.isContinuous,
                onChanged: (bool newValue) {
                  context.read<ToolCubit>().updateTool(
                    tool.copyWith(isContinuous: newValue),
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
