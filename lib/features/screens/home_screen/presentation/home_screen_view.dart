import 'package:flutter/material.dart';
import 'package:pixel32_t/core/style/app_colors.dart';
import 'package:pixel32_t/core/widgets/bs_button/bs_button.dart';
import 'package:pixel32_t/core/widgets/resizable_tabs.dart';
import 'package:pixel32_t/features/cloth/presentation/cloth.dart';
import 'package:pixel32_t/features/panels/colors_panel/colors_panel.dart';
import 'package:pixel32_t/features/editor/presentation/canvas_editor.dart';
import 'package:pixel32_t/features/panels/editor_panel/editor_panel.dart';
import 'package:pixel32_t/features/panels/layers_panel/layers_panel.dart';
import 'package:pixel32_t/features/panels/preview_panel/preview_panel.dart';
import 'package:pixel32_t/features/panels/tools_panel/tools_panel.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  Widget get _tabDivider {
    return Container(color: AppColors.foreground);
  }

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
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Container(color: AppColors.foreground),
              ),
              children: [
                ResizableTabs(
                  axis: Axis.vertical,
                  dividerSize: 16,
                  tabFlexes: [2, 1],
                  divider: _tabDivider,
                  children: [ToolsPanel(), ColorsPanel()],
                ),
                EditorPanel(),
                ResizableTabs(
                  axis: Axis.vertical,
                  dividerSize: 16,
                  tabFlexes: [2, 1],
                  divider: _tabDivider,
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
