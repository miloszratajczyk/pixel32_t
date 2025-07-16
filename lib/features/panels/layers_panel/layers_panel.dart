import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/core/style/app_colors.dart';
import 'package:pixel32_t/core/widgets/bs_button/bs_button.dart';
import 'package:pixel32_t/core/widgets/bs_button/bs_button_style.dart';
import 'package:pixel32_t/features/cloth/cubit/cloth_cubit.dart';

class LayersPanel extends StatelessWidget {
  const LayersPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ClothCubit>();
    final layers = cubit.getLayers();
    return Column(
      children: [
        for (int i = 0; i < layers.length; i++)
          Row(
            children: [
              BsButton(
                onTap: () {
                  context.read<ClothCubit>().selectLayer(i);
                },
                style: cubit.state.activeLayer == i
                    ? BsButtonStyle(textColor: AppColors.primary)
                    : BsButtonStyle(),
                child: Text("Layer $i"),
              ),
              BsButton(
                onTap: () {
                  context.read<ClothCubit>().toggleVisibility(i);
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
            context.read<ClothCubit>().addLayer();
          },
          child: Text("Add layer"),
        ),
      ],
    );
  }
}
