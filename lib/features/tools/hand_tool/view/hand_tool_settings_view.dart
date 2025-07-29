import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/tools/cubit/tool_cubit.dart';
import 'package:pixel32_t/features/tools/hand_tool/model/hand_tool.dart';

class HandToolSettingsView extends StatelessWidget {
  const HandToolSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final state = context.watch<ToolCubit>().state;
        if (state is HandTool) {
          final tool = state;
          return Column(children: [Text(tool.name)]);
        }
        return Text("Invalid state");
      },
    );
  }
}
