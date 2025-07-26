import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/cubit/cloth_cubit.dart';
import 'package:pixel32_t/features/core/view/widgets/bs_button/bs_button.dart';

class PreviewPanel extends StatefulWidget {
  const PreviewPanel({super.key});

  @override
  State<PreviewPanel> createState() => _PreviewPanelState();
}

class _PreviewPanelState extends State<PreviewPanel> {
  Offset transformOffset = Offset.zero;
  int transformScale = 1;

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
    final image = context.read<ClothCubit>().state.image;
    if (image == null) return;
    if ((transformOffset.dx).abs() - (0.4 * image.width * transformScale) >
            0.5 * constraints.maxWidth ||
        (transformOffset.dy).abs() - (0.4 * image.height * transformScale) >
            0.5 * constraints.maxHeight) {
      setState(() {
        transformOffset = Offset.zero;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      child: Builder(
                        builder: (context) {
                          final image = context.select(
                            (ClothCubit cubit) => cubit.state.image,
                          );
                          if (image == null) {
                            return CircularProgressIndicator();
                          }
                          return RawImage(
                            image: image,
                            scale: 1.0,
                            filterQuality: FilterQuality.none,
                          );
                        },
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
