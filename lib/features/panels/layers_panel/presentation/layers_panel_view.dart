import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/core/style/app_colors.dart';
import 'package:pixel32_t/core/widgets/bs_button/bs_button.dart';
import 'package:pixel32_t/core/widgets/bs_button/bs_button_style.dart';
import 'package:pixel32_t/features/panels/layers_panel/cubit/layers_panel_cubit.dart';

class LayersPanelView extends StatelessWidget {
  const LayersPanelView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LayersPanelCubit>().state;
    final layers = state.clothLayers;
    return Column(
      children: [
        for (int i = 0; i < layers.length; i++)
          Row(
            children: [
              BsButton(
                onTap: () {
                  context.read<LayersPanelCubit>().selectActiveLayer(i);
                },
                style: state.activeLayer == i
                    ? BsButtonStyle(textColor: AppColors.primary)
                    : BsButtonStyle(),
                child: Text("Layer $i"),
              ),
              BsButton(
                onTap: () {
                  context.read<LayersPanelCubit>().toggleVisibility(i);
                },
                style: layers[i].visible
                    ? BsButtonStyle(textColor: AppColors.primary)
                    : BsButtonStyle(),
                child: layers[i].visible ? Text("O_o") : Text("-_-"),
              ),
            ],
          ),

        BsButton(
          onTap: () {
            context.read<LayersPanelCubit>().addLayer();
          },
          child: Text("Add layer"),
        ),
      ],
    );
  }
}
