import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/application/cloth_repository.dart';
import 'package:pixel32_t/features/cloth/cubit/cloth_cubit.dart';
import 'package:pixel32_t/features/panels/editor_panel/cubit/editor_panel_cubit.dart';
import 'package:pixel32_t/features/screens/home_screen/presentation/home_screen_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final clothRepository = context.read<ClothRepository>();
    return MultiBlocProvider(
      providers: [
        BlocProvider<EditorPanelCubit>(create: (_) => EditorPanelCubit()),
        BlocProvider<ClothCubit>(create: (_) => ClothCubit(clothRepository)),
      ],
      child: HomeScreenView(),
    );
  }
}
