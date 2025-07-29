import 'dart:ui' as ui;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';

class ClothCubit extends Cubit<ui.Image?> {
  ClothCubit(ClothRepository clothRepository)
    : _clothRepository = clothRepository,
      super(null) {
    _clothRepository.imageStream.listen((image) {
      emit(image);
    });
  }

  final ClothRepository _clothRepository;
}
