import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/application/cloth_repository.dart';
import 'package:pixel32_t/features/panels/color_panel/cubit/color_panel_cubit.dart';
import 'package:pixel32_t/features/panels/color_panel/presentation/color_panel_view.dart';

class ColorPanel extends StatelessWidget {
  const ColorPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorPanelView();
  }
}
