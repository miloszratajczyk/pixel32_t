import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pixel32_t/core/widgets/bs_button/bs_button.dart';
import 'package:pixel32_t/features/panels/color_panel/cubit/color_panel_cubit.dart';
import 'package:pixel32_t/features/panels/color_panel/presentation/widgets/color_picker.dart';
import 'package:pixel32_t/features/panels/color_panel/presentation/widgets/color_wheel.dart';

class ColorPanelView extends HookWidget {
  const ColorPanelView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ColorPanelCubit>().state;
    final isSelectingPrimary = useState(true);
    return SingleChildScrollView(
      child: Column(
        children: [
          ColorPicker(
            onColorSelected: (color) {
              if (isSelectingPrimary.value) {
                context.read<ColorPanelCubit>().selectPrimaryColor(color);
              } else {
                context.read<ColorPanelCubit>().selectSecondaryColor(color);
              }
            },
          ),

          Row(
            children: [
              InkWell(
                onTap: () {
                  isSelectingPrimary.value = true;
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: state.primaryColor,
                    shape: isSelectingPrimary.value
                        ? BoxShape.rectangle
                        : BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  isSelectingPrimary.value = false;
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: state.secondaryColor,
                    shape: !isSelectingPrimary.value
                        ? BoxShape.rectangle
                        : BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                ),
              ),
            ],
          ),
          BsButton(
            onTap: () {
              context.read<ColorPanelCubit>().savePrimaryColor();
            },
            child: Text("Save primary"),
          ),

          BsButton(
            onTap: () {
              context.read<ColorPanelCubit>().saveSecondaryColor();
            },
            child: Text("Save secondary"),
          ),

          Wrap(
            children: [
              for (var colro in state.colorPalette)
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: colro,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
