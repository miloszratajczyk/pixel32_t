import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/model/cloth_layer.dart';
import 'package:pixel32_t/features/cloth/model/supported_blend_modes.dart';
import 'package:pixel32_t/features/core/view/style/app_colors.dart';
import 'package:pixel32_t/features/core/view/widgets/bs_button/bs_button.dart';
import 'package:pixel32_t/features/core/view/widgets/bs_button/bs_button_style.dart';
import 'package:pixel32_t/features/core/view/widgets/bs_button/bs_dropdown_button.dart';
import 'package:pixel32_t/features/core/view/widgets/bs_button/bs_icon_button.dart';
import 'package:pixel32_t/features/panels/layers_panel/cubit/layers_panel_cubit.dart';

// TODO: Complete rework when new widget library is done

class LayersPanel extends StatelessWidget {
  const LayersPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<LayersPanelCubit>();
    final layers = cubit.state.layers;
    return SingleChildScrollView(
      child: Column(
        children: [
          ReorderableListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            onReorder: (oldIndex, newIndex) {
              context.read<LayersPanelCubit>().reorder(oldIndex, newIndex);
            },
            children: [
              for (int i = 0; i < layers.length; i++)
                Padding(
                  key: layers[i].id,
                  padding: EdgeInsets.only(right: 8.0),
                  child: LayerSettings(layers: layers, i: i, cubit: cubit),
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
      ),
    );
  }
}

class LayerSettings extends StatefulWidget {
  const LayerSettings({
    super.key,
    required this.layers,
    required this.i,
    required this.cubit,
  });

  final UnmodifiableListView<ClothLayer> layers;
  final int i;
  final LayersPanelCubit cubit;

  @override
  State<LayerSettings> createState() => _LayerSettingsState();
}

class _LayerSettingsState extends State<LayerSettings> {
  bool _isExpanded = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {
          _isExpanded = false;
        });
      }
    });
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _focusNode.requestFocus();
      } else {
        _focusNode.unfocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final layer = widget.layers[widget.i];
    return Focus(
      focusNode: _focusNode,
      canRequestFocus: true,
      child: Column(
        children: [
          Row(
            children: [
              BsIconButton(
                iconAssetPath: layer.isVisible
                    ? "assets/icons/eye_open.svg"
                    : "assets/icons/eye_closed.svg",
                onTap: () {
                  context.read<LayersPanelCubit>().toggleVisibility(widget.i);
                },
                iconSize: 29,
                iconColor: widget.cubit.state.activeLayerIx == widget.i
                    ? AppColors.primary
                    : AppColors.foreground,
                style: BsButtonStyle(
                  padding: EdgeInsets.all(3),
                  splashColor: widget.cubit.state.activeLayerIx == widget.i
                      ? AppColors.primary
                      : AppColors.foreground,
                ),
              ),
              Expanded(
                child: BsButton(
                  onTap: () {
                    context.read<LayersPanelCubit>().selectLayer(widget.i);
                  },
                  style: widget.cubit.state.activeLayerIx == widget.i
                      ? BsButtonStyle(textColor: AppColors.primary)
                      : BsButtonStyle(),
                  child: Text("Layer ${widget.layers[widget.i].id}"),
                ),
              ),
              BsButton(
                onTap: _toggleExpanded,
                style: widget.cubit.state.activeLayerIx == widget.i
                    ? BsButtonStyle(textColor: AppColors.primary)
                    : BsButtonStyle(),
                child: Text(_isExpanded ? "[___]" : "[...]"),
              ),
            ],
          ),
          if (_isExpanded)
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: widget.cubit.state.activeLayerIx == widget.i
                        ? AppColors.primary
                        : AppColors.foreground,
                    width: 2.0,
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Slider(
                    value: layer.opacity.toDouble(),
                    min: 0,
                    max: 1.0,
                    label: layer.opacity.toString(),
                    onChanged: (value) {
                      context.read<LayersPanelCubit>().updateLayer(
                        widget.i,
                        layer.copyWith(opacity: value),
                      );
                    },
                  ),
                  BsDropdownButton<BlendMode>(
                    value: layer.blendMode,
                    items: BlendMode.values,
                    itemToString: (item) => item.name,
                    onChanged: (newValue) {
                      context.read<LayersPanelCubit>().updateLayer(
                        widget.i,
                        layer.copyWith(blendMode: newValue),
                      );
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
