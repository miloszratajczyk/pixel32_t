import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/tools/cubit/tool_cubit.dart';
import 'package:pixel32_t/features/tools/pencil_tool/model/pencil_tool.dart';

class PencilToolSettingsView extends StatelessWidget {
  const PencilToolSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final state = context.watch<ToolCubit>().state;
        if (state is PencilTool) {
          final tool = state;
          return Column(children: [Text(tool.name)]);
        }
        return Text("Invalid state");
      },
    );
  }
}
