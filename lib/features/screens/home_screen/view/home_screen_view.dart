import 'package:flutter/material.dart';
import 'package:pixel32_t/features/core/view/style/app_colors.dart';
import 'package:pixel32_t/features/core/view/widgets/resizable_tabs.dart';
import 'package:pixel32_t/features/panels/colors_panel/view/colors_panel.dart';
import 'package:pixel32_t/features/panels/editor_panel/view/editor_panel.dart';
import 'package:pixel32_t/features/panels/layers_panel/view/layers_panel.dart';
import 'package:pixel32_t/features/panels/preview_panel/view/preview_panel.dart';
import 'package:pixel32_t/features/panels/tools_panel/tools_panel.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 32, child: Center(child: Text("TOP BAR"))),
          Expanded(
            child: ResizableTabs(
              dividerSize: 16,
              tabFlexes: [1, 4, 1],
              divider: Container(
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: Container(color: AppColors.foreground),
              ),
              children: [
                ResizableTabs(
                  axis: Axis.vertical,
                  dividerSize: 16,
                  tabFlexes: [2, 1],
                  divider: Container(
                    padding: EdgeInsets.symmetric(vertical: 7),
                    child: Container(color: AppColors.foreground),
                  ),
                  children: [ToolsPanel(), ColorsPanel()],
                ),
                EditorPanel(),
                ResizableTabs(
                  axis: Axis.vertical,
                  dividerSize: 16,
                  tabFlexes: [2, 1],
                  divider: Container(
                    padding: EdgeInsets.symmetric(vertical: 7),
                    child: Container(color: AppColors.foreground),
                  ),
                  children: [LayersPanel(), PreviewPanel()],
                ),
              ],
            ),
          ),

          SizedBox(height: 24, child: Center(child: Text("BOTTOM BAR"))),
        ],
      ),
    );
  }
}
