import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pixel32_t/features/panels/editor_panel/bloc/editor_panel_bloc.dart';

class EditorPanelView extends HookWidget {
  const EditorPanelView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<EditorPanelBloc>().state;

    if (state.image == null) {
      return Center(child: CircularProgressIndicator());
    }

    final transformScale = useState(6);
    final transformOffset = useState(Offset.zero);

    return ClipRRect(
      child: Center(
        child: Transform.translate(
          offset: transformOffset.value,
          child: Transform.scale(
            scale: transformScale.value.toDouble(),
            child: Listener(
              onPointerDown: (pointerEvent) => context
                  .read<EditorPanelBloc>()
                  .add(EditorPanelPointerDown(pointerEvent)),
              onPointerMove: (pointerEvent) => context
                  .read<EditorPanelBloc>()
                  .add(EditorPanelPointerMove(pointerEvent)),
              onPointerUp: (pointerEvent) => context
                  .read<EditorPanelBloc>()
                  .add(EditorPanelPointerUp(pointerEvent)),
              onPointerSignal: (pointerEvent) => context
                  .read<EditorPanelBloc>()
                  .add(EditorPanelPointerSignal(pointerEvent)),
              child: RawImage(
                image: state.image,
                scale: 1.0,

                filterQuality: FilterQuality.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
