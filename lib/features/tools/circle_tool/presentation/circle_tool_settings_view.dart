import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/core/widgets/bs_button/bs_button.dart';
import 'package:pixel32_t/features/tools/circle_tool/model/circle_tool.dart';
import 'package:pixel32_t/features/tools/cubit/tool_cubit.dart';

class CircleToolSettingsView extends StatelessWidget {
  const CircleToolSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ToolCubit>().state;
    if (state is CircleTool) {
      final tool = state;
      return Column(
        children: [
          Text(tool.name),
          BsButton(
            onTap: () {
              context.read<ToolCubit>().updateTool(
                tool.copyWith(shouldFill: !tool.shouldFill),
              );
            },
            child: Text(tool.shouldFill ? "YES" : "NO"),
          ),
        ],
      );
    }

    return Text("TODO An error occured");
  }
}
