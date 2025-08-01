import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/core/view/widgets/bs_button/bs_button.dart';
import 'package:pixel32_t/features/selection_layer/cubit/selection_cubit.dart';
import 'package:pixel32_t/features/tools/cubit/tool_cubit.dart';
import 'package:pixel32_t/features/tools/lasso_select_tool/model/lasso_select_tool.dart';
import 'package:pixel32_t/features/tools/rectangle_select_tool/model/rectangle_select_tool.dart';

class LassoSelectToolSettingsView extends StatelessWidget {
  const LassoSelectToolSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ToolCubit>().state;
    if (state is LassoSelectTool) {
      final tool = state;
      return Column(
        children: [
          Text(tool.name),
          BsButton(
            onTap: () {
              context.read<SelectionCubit>().selectAll();
            },
            child: Text("Select all"),
          ),
          BsButton(
            onTap: () {
              context.read<SelectionCubit>().deselectAll();
            },
            child: Text("Deselect all"),
          ),
          BsButton(
            onTap: () {
              context.read<SelectionCubit>().invertSelection();
            },
            child: Text("invert"),
          ),
        ],
      );
    }

    return Text("TODO An error occured");
  }
}
