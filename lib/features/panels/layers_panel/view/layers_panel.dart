import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/core/view/style/app_colors.dart';
import 'package:pixel32_t/features/core/view/widgets/bs_button/bs_button.dart';
import 'package:pixel32_t/features/core/view/widgets/bs_button/bs_button_style.dart';
import 'package:pixel32_t/features/panels/layers_panel/cubit/layers_panel_cubit.dart';

class LayersPanel extends StatelessWidget {
  const LayersPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<LayersPanelCubit>();
    final layers = cubit.state.layers;
    return Column(
      children: [
        for (int i = 0; i < layers.length; i++)
          Row(
            children: [
              BsButton(
                onTap: () {
                  context.read<LayersPanelCubit>().selectLayer(i);
                },
                style: cubit.state.activeLayerIx == i
                    ? BsButtonStyle(textColor: AppColors.primary)
                    : BsButtonStyle(),
                child: Text("Layer $i"),
              ),
              BsButton(
                onTap: () {
                  context.read<LayersPanelCubit>().toggleVisibility(i);
                },
                style: layers[i].isVisible
                    ? BsButtonStyle(textColor: AppColors.primary)
                    : BsButtonStyle(),
                child: layers[i].isVisible ? Text("O_o") : Text("-_-"),
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
