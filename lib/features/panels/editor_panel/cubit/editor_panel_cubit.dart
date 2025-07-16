import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'editor_panel_state.dart';

class EditorPanelCubit extends Cubit<EditorPanelState> {
  EditorPanelCubit() : super(EditorPanelState());

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
}
