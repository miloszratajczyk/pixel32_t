import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/cubit/cloth_cubit.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';
import 'package:pixel32_t/features/panels/colors_panel/cubit/colors_panel_cubit.dart';
import 'package:pixel32_t/features/panels/editor_panel/cubit/editor_panel_cubit.dart';
import 'package:pixel32_t/features/panels/layers_panel/cubit/layers_panel_cubit.dart';
import 'package:pixel32_t/features/screens/home_screen/view/home_screen_view.dart';
import 'package:pixel32_t/features/selection_layer/cubit/selection_cubit.dart';
import 'package:pixel32_t/features/tools/core/repo/tool_repository.dart';
import 'package:pixel32_t/features/tools/cubit/tool_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final clothRepository = context.read<ClothRepository>();
    final toolRepository = context.read<ToolRepository>();
    return MultiBlocProvider(
      providers: [
        BlocProvider<ClothCubit>(create: (_) => ClothCubit(clothRepository)),
        BlocProvider<ToolCubit>(create: (_) => ToolCubit(toolRepository)),
        BlocProvider<EditorPanelCubit>(
          create: (_) => EditorPanelCubit(toolRepository),
        ),
        BlocProvider<SelectionCubit>(
          create: (_) => SelectionCubit(clothRepository),
        ),
        BlocProvider<ColorsPanelCubit>(
          create: (_) => ColorsPanelCubit(toolRepository),
        ),
        BlocProvider<LayersPanelCubit>(
          create: (_) => LayersPanelCubit(clothRepository),
        ),
      ],
      child: HomeScreenView(),
    );
  }
}
