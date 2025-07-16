import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/cubit/cloth_cubit.dart';
import 'package:pixel32_t/features/panels/editor_panel/cubit/editor_panel_cubit.dart';

class EditorPanel extends StatefulWidget {
  const EditorPanel({super.key});

  @override
  State<EditorPanel> createState() => _EditorPanelState();
}

class _EditorPanelState extends State<EditorPanel> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<EditorPanelCubit>().state;

    return ClipRRect(
      child: Center(
        child: Transform.translate(
          offset: state.offset,
          child: Transform.scale(
            scale: state.scale.toDouble(),
            child: Listener(
              onPointerDown: (pointerEvent) =>
                  context.read<ClothCubit>().pointerDown(pointerEvent, context),
              onPointerMove: (pointerEvent) =>
                  context.read<ClothCubit>().pointerMove(pointerEvent, context),
              onPointerUp: (pointerEvent) =>
                  context.read<ClothCubit>().pointerUp(pointerEvent, context),
              onPointerSignal: (pointerEvent) => context
                  .read<ClothCubit>()
                  .pointerSignal(pointerEvent, context),
              child: Builder(
                builder: (context) {
                  final image = context.select(
                    (ClothCubit cubit) => cubit.state.image,
                  );
                  return RawImage(
                    image: image,
                    scale: 1.0,

                    filterQuality: FilterQuality.none,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
