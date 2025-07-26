import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixel32_t/features/core/view/style/app_colors.dart';
import 'package:pixel32_t/features/core/view/widgets/bs_button/bs_button.dart';
import 'package:pixel32_t/features/core/view/widgets/bs_button/bs_button_style.dart';
import 'package:pixel32_t/features/core/view/widgets/bs_button/bs_icon_button.dart';
import 'package:pixel32_t/features/tools/core/widgets/animated_tool_icon.dart';
import 'package:pixel32_t/features/tools/cubit/tool_cubit.dart';

class ToolsPanel extends StatelessWidget {
  const ToolsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ToolCubit>();
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: cubit.state.buildSettingsView()),
          SizedBox(
            width: 64,
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                for (var tool in cubit.getTools())
                  BsIconButton(
                    iconAssetPath: tool.icon,
                    onTap: () {
                      context.read<ToolCubit>().selectTool(tool);
                    },
                    iconSize: 24,
                    iconColor: tool == cubit.state
                        ? AppColors.primary
                        : AppColors.foreground,
                    style: BsButtonStyle(
                      padding: EdgeInsets.all(3),
                      splashColor: tool == cubit.state
                          ? AppColors.primary
                          : AppColors.foreground,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
