import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/core/widgets/bs_button/bs_button.dart';
import 'package:pixel32_t/features/tools/cubit/tool_cubit.dart';
import 'package:pixel32_t/features/tools/rectangle_tool/model/rectangle_tool.dart';

class RectangleToolSettingsView extends StatelessWidget {
  const RectangleToolSettingsView({required this.rectangleTool, super.key});

  final RectangleTool rectangleTool;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ToolCubit>().state;
    if (state is RectangleTool) {
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
