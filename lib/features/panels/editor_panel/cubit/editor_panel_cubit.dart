import 'dart:ui' show Offset;

import 'package:flutter/gestures.dart'
    show PointerScrollEvent, PointerSignalEvent;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixel32_t/features/tools/core/repo/tool_repository.dart';

part 'editor_panel_state.dart';
part 'editor_panel_cubit.freezed.dart';

class EditorPanelCubit extends Cubit<EditorPanelState> {
  EditorPanelCubit(ToolRepository toolRepository)
    : _toolRepository = toolRepository,
      super(EditorPanelState());
  final ToolRepository _toolRepository;

  void zoomIn() {
    emit(state.copyWith(scale: state.scale + 1));
  }

  void zoomOut() {
    if (state.scale <= 1) return;
    emit(state.copyWith(scale: state.scale - 1));
  }

  void updateOffset(Offset offset) {
    emit(state.copyWith(offset: state.offset + offset));
  }

  void setShouldHandleZoom(bool newValue) {
    emit(state.copyWith(shouldHandleScroll: newValue));
  }

  void onPointerDown(PointerDownEvent pointerEvent, BuildContext context) {
    _toolRepository.currentTool.onPointerDown(pointerEvent, context);
  }

  void onPointerMove(PointerMoveEvent pointerEvent, BuildContext context) {
    _toolRepository.currentTool.onPointerMove(pointerEvent, context);
  }

  void onPointerUp(PointerUpEvent pointerEvent, BuildContext context) {
    _toolRepository.currentTool.onPointerUp(pointerEvent, context);
  }

  void onPointerSignal(PointerSignalEvent pointerEvent, BuildContext context) {
    if (state.shouldHandleScroll && pointerEvent is PointerScrollEvent) {
      if (pointerEvent.scrollDelta.dy > 0) {
        zoomOut();
      } else if (pointerEvent.scrollDelta.dy < 0) {
        zoomIn();
      }
    }
    _toolRepository.currentTool.onPointerSignal(pointerEvent, context);
  }
}
