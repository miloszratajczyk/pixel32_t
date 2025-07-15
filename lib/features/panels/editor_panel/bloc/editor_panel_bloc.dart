import 'dart:async';
import 'dart:ui' as ui;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:pixel32_t/features/cloth/application/cloth_repository.dart';
import 'package:pixel32_t/features/cloth/application/redraw_scheduler.dart';

part 'editor_panel_event.dart';
part 'editor_panel_state.dart';

class EditorPanelBloc extends Bloc<EditorPanelEvent, EditorPanelState> {
  ClothRepository clothRepository;
  late final StreamSubscription<ui.Image> _sub;

  EditorPanelBloc(this.clothRepository) : super(EditorPanelState(null)) {
    _sub = clothRepository.imageStream.listen((image) {
      add(EditorPanelImageUpdated(image));
    });

    on<EditorPanelRedrawTicked>((event, emit) async {
      final image = await clothRepository.generateImage();
      emit(EditorPanelState(image));
    });

    // on<EditorPanelPixelSet>((event, emit) async {
    //   clothRepository.setPixel(event.x, event.y);
    //   await _regenerateImage(emit);
    // });
    on<EditorPanelRefreshRequested>((event, emit) async {
      await _regenerateImage(emit);
    });
    on<EditorPanelImageUpdated>((event, emit) {
      emit(EditorPanelState(event.image));
    });

    on<EditorPanelPointerDown>((event, emit) async {
      clothRepository.activeTool.onPointerDown(
        event.pointerEvent,
        clothRepository,
      );
      clothRepository.requestRedraw();
    });
    on<EditorPanelPointerMove>((event, emit) async {
      clothRepository.activeTool.onPointerMove(
        event.pointerEvent,
        clothRepository,
      );
      clothRepository.requestRedraw();
    });
    on<EditorPanelPointerUp>((event, emit) async {
      clothRepository.activeTool.onPointerUp(
        event.pointerEvent,
        clothRepository,
      );
      clothRepository.requestRedraw();
    });
    on<EditorPanelPointerSignal>((event, emit) async {
      clothRepository.activeTool.onPointerSignal(
        event.pointerEvent,
        clothRepository,
      );
      clothRepository.requestRedraw();
    });
  }

  Future<void> _regenerateImage(Emitter<EditorPanelState> emit) async {
    final image = await clothRepository.generateImage();
    emit(EditorPanelState(image, state.ix + 1));
  }

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }
}
