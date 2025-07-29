import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/tools/color_picker_tool/model/color_picker_tool.dart';
import 'package:pixel32_t/features/tools/cubit/tool_cubit.dart';

class ColorPickerToolSettingsView extends StatelessWidget {
  const ColorPickerToolSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final state = context.watch<ToolCubit>().state;
        if (state is ColorPickerTool) {
          final tool = state;
          return Column(
            children: [
              Text(tool.name),
              Switch(
                value: state.isSingleLayer,
                onChanged: (bool newValue) {
                  context.read<ToolCubit>().updateTool(
                    tool.copyWith(isSingleLayer: newValue),
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
