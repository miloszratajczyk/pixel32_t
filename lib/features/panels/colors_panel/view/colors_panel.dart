import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/cubit/cloth_cubit.dart';
import 'package:pixel32_t/features/core/view/widgets/bs_button/bs_button.dart';
import 'package:pixel32_t/features/panels/colors_panel/cubit/colors_panel_cubit.dart';
import 'package:pixel32_t/features/panels/colors_panel/view/widgets/color_picker.dart';

class ColorsPanel extends StatefulWidget {
  const ColorsPanel({super.key});

  @override
  State<ColorsPanel> createState() => _ColorsPanelState();
}

class _ColorsPanelState extends State<ColorsPanel> {
  bool isSelectingPrimary = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ColorPicker(
            onColorSelected: (color) {
              if (isSelectingPrimary) {
                context.read<ColorsPanelCubit>().setPrimaryColor(color);
              } else {
                context.read<ColorsPanelCubit>().setSecondaryColor(color);
              }
            },
          ),

          Row(
            children: [
              InkWell(
                onTap: () {
                  isSelectingPrimary = true;
                },
                child: Builder(
                  builder: (context) {
                    final primaryColor = context.select(
                      (ColorsPanelCubit cubit) => cubit.state.primaryColor,
                    );
                    return Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: isSelectingPrimary
                            ? BoxShape.rectangle
                            : BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                    );
                  },
                ),
              ),

              InkWell(
                onTap: () {
                  isSelectingPrimary = false;
                },
                child: Builder(
                  builder: (context) {
                    final secondaryColor = context.select(
                      (ColorsPanelCubit cubit) => cubit.state.secondaryColor,
                    );
                    return Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        shape: !isSelectingPrimary
                            ? BoxShape.rectangle
                            : BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          BsButton(
            onTap: () {
              context.read<ColorsPanelCubit>().savePrimaryColor();
            },
            child: Text("Save primary"),
          ),

          BsButton(
            onTap: () {
              context.read<ColorsPanelCubit>().saveSecondaryColor();
            },
            child: Text("Save secondary"),
          ),

          Builder(
            builder: (context) {
              final colorPalette = context.select(
                (ColorsPanelCubit cubit) => cubit.state.colorPalette,
              );
              return Wrap(
                children: [
                  for (var color in colorPalette)
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
