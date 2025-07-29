import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/core/view/widgets/bs_button/bs_button.dart';
import 'package:pixel32_t/features/selection_layer/cubit/selection_cubit.dart';
import 'package:pixel32_t/features/tools/cubit/tool_cubit.dart';
import 'package:pixel32_t/features/tools/lasso_tool/model/lasso_tool.dart';

class LassoToolSettingsView extends StatelessWidget {
  const LassoToolSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ToolCubit>().state;
    if (state is LassoTool) {
      final tool = state;
      return Column(children: [Text(tool.name)]);
    }

    return Text("TODO An error occured");
  }
}
