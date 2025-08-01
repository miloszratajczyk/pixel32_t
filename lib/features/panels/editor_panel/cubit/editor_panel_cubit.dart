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

  /// Increases the current `scale` value by one
  void zoomIn() {
    emit(state.copyWith(scale: state.scale + 1));
  }

  /// Decreases the current `scale` value by one
  void zoomOut() {
    if (state.scale <= 1) return;
    emit(state.copyWith(scale: state.scale - 1));
  }

  /// Updates the current `offset` by adding the given `offset` value
  void updateOffset(Offset offset) {
    emit(state.copyWith(offset: state.offset + offset));
  }

  /// Sets whether the zoom should be handled by pointer scroll events.
  void setShouldHandleZoom(bool newValue) {
    emit(state.copyWith(shouldHandleScroll: newValue));
  }

  /// Handles pointer down events by forwarding them to the currently selected tool
  void onPointerDown(PointerDownEvent pointerEvent, BuildContext context) {
    _toolRepository.currentTool.onPointerDown(pointerEvent, context);
  }

  /// Handles pointer move events by forwarding them to the currently selected tool
  void onPointerMove(PointerMoveEvent pointerEvent, BuildContext context) {
    _toolRepository.currentTool.onPointerMove(pointerEvent, context);
  }

  /// Handles pointer up events by forwarding them to the currently selected tool
  void onPointerUp(PointerUpEvent pointerEvent, BuildContext context) {
    _toolRepository.currentTool.onPointerUp(pointerEvent, context);
  }

  /// Handles pointer signal events by forwarding them to the currently selected tool
  /// optionally zooming and forwarding
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
