import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/core/widgets/bs_button/bs_button.dart';
import 'package:pixel32_t/features/panels/tools_panel/cubit/tools_panel_cubit.dart';

class ToolsPanelView extends StatelessWidget {
  const ToolsPanelView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ToolsPanelCubit>();
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var tool in cubit.getToolsList())
            BsButton(
              onTap: () {
                context.read<ToolsPanelCubit>().selectTool(tool);
              },
              child: Text(tool.name),
            ),

          cubit.state.buildSettingsView(),
        ],
      ),
    );
  }
}
