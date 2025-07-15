import 'dart:async';
import 'dart:ui' as ui;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pixel32_t/features/cloth/application/cloth_repository.dart';

class PreviewPanelCubit extends Cubit<ui.Image?> {
  final ClothRepository clothRepository;
  late final StreamSubscription<ui.Image> _sub;

  PreviewPanelCubit(this.clothRepository) : super(null) {
    _sub = clothRepository.imageStream.listen((image) {
      emit(image);
    });
  }

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }
}
