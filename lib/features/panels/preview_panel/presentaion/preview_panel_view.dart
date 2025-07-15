import 'dart:ui' as ui;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/core/widgets/bs_button/bs_button.dart';
import 'package:pixel32_t/features/panels/preview_panel/cubit/preview_panel_cubit.dart';

class PreviewPanelView extends StatefulWidget {
  const PreviewPanelView({super.key});

  @override
  State<PreviewPanelView> createState() => _PreviewPanelViewState();
}

class _PreviewPanelViewState extends State<PreviewPanelView> {
  Offset transformOffset = Offset.zero;
  int transformScale = 1;

  double _calculateAspectRatio(ui.Image? image) {
    if (image == null) return 1.0;
    return image.width / image.height;
  }

  void _zoomIn() {
    setState(() {
      transformScale++;
    });
  }

  void _zoomOut() {
    if (transformScale <= 1) return;
    setState(() {
      transformScale--;
    });
  }

  void _handlePointerSignal(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      if (event.scrollDelta.dy < 0) {
        _zoomIn();
      } else if (event.scrollDelta.dy > 0) {
        _zoomOut();
      }
    }
  }

  void _handlePointerMove(PointerMoveEvent event) {
    setState(() {
      transformOffset += event.localDelta;
    });
  }

  void _handlePointerUp(PointerUpEvent event, BoxConstraints constraints) {
    final state = context.read<PreviewPanelCubit>().state;
    if (state == null) return;
    if ((transformOffset.dx).abs() - (0.4 * state.width * transformScale) >
            0.5 * constraints.maxWidth ||
        (transformOffset.dy).abs() - (0.4 * state.height * transformScale) >
            0.5 * constraints.maxHeight) {
      setState(() {
        transformOffset = Offset.zero;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PreviewPanelCubit>().state;

    return ClipRRect(
      child: Stack(
        children: [
          Positioned.fill(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Listener(
                  onPointerSignal: _handlePointerSignal,
                  onPointerMove: (event) => _handlePointerMove(event),
                  onPointerUp: (event) => _handlePointerUp(event, constraints),
                  child: Transform.translate(
                    offset: transformOffset,
                    child: Transform.scale(
                      scale: transformScale.toDouble(),
                      child: state == null
                          ? const CircularProgressIndicator()
                          : RawImage(
                              image: state,
                              scale: 1.0,
                              filterQuality: FilterQuality.none,
                            ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 4,
            right: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BsButton(onTap: _zoomOut, child: Text("-")),
                Text("x$transformScale"),
                BsButton(onTap: _zoomIn, child: Text("+")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
