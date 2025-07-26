import 'dart:ui';

import 'package:flutter/src/gestures/events.dart';
import 'package:flutter/src/widgets/framework.dart';
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
    if (state.scale < 1) return;
    emit(state.copyWith(scale: state.scale - 1));
  }

  void updateOffset(Offset offset) {
    emit(state.copyWith(offset: offset));
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
    _toolRepository.currentTool.onPointerSignal(pointerEvent, context);
  }
}
