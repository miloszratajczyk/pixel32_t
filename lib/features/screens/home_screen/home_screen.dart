import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/application/cloth_repository.dart';
import 'package:pixel32_t/features/panels/color_panel/cubit/color_panel_cubit.dart';
import 'package:pixel32_t/features/panels/editor_panel/bloc/editor_panel_bloc.dart';
import 'package:pixel32_t/features/panels/preview_panel/cubit/preview_panel_cubit.dart';
import 'package:pixel32_t/features/panels/tools_panel/cubit/tools_panel_cubit.dart';
import 'package:pixel32_t/features/screens/home_screen/presentation/home_screen_view.dart';
import 'package:pixel32_t/features/panels/layers_panel/cubit/layers_panel_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final clothRepository = context.read<ClothRepository>();
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorPanelCubit>(
          create: (_) => ColorPanelCubit(clothRepository),
        ),
        BlocProvider<LayersPanelCubit>(
          create: (_) => LayersPanelCubit(clothRepository),
        ),
        BlocProvider<ToolsPanelCubit>(
          create: (_) => ToolsPanelCubit(clothRepository),
        ),
        BlocProvider<EditorPanelBloc>(
          create: (_) => EditorPanelBloc(clothRepository),
        ),
        BlocProvider<PreviewPanelCubit>(
          create: (_) => PreviewPanelCubit(clothRepository),
        ),
      ],
      child: HomeScreenView(),
    );
  }
}
