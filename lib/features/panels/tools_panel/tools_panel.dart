import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixel32_t/core/style/app_colors.dart';
import 'package:pixel32_t/core/widgets/bs_button/bs_button.dart';
import 'package:pixel32_t/core/widgets/bs_button/bs_button_style.dart';
import 'package:pixel32_t/core/widgets/bs_button/bs_icon_button.dart';
import 'package:pixel32_t/features/cloth/cubit/cloth_cubit.dart';
import 'package:pixel32_t/features/tools/core/widgets/animated_tool_icon.dart';

class ToolsPanel extends StatelessWidget {
  const ToolsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ClothCubit>();
    return SingleChildScrollView(
      child: Column(
        children: [
          // for (var tool in cubit.getTools())
          //   Row(
          //     children: [
          //       BsIconButton(
          //         iconAssetPath: tool.icon,
          //         onTap: () {
          //           context.read<ClothCubit>().selectTool(tool);
          //         },
          //       ),
          //       BsButton(
          //         onTap: () {
          //           context.read<ClothCubit>().selectTool(tool);
          //         },
          //         child: Text(tool.name),
          //       ),
          //     ],
          //   ),
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
                      context.read<ClothCubit>().selectTool(tool);
                    },
                    iconSize: 24,
                    iconColor: tool == cubit.state.activeTool
                        ? AppColors.primary
                        : AppColors.foreground,
                    style: BsButtonStyle(
                      padding: EdgeInsets.all(3),
                      splashColor: tool == cubit.state.activeTool
                          ? AppColors.primary
                          : AppColors.foreground,
                    ),
                  ),
              ],
            ),
          ),

          cubit.state.activeTool.buildSettingsView(),
        ],
      ),
    );
  }
}
