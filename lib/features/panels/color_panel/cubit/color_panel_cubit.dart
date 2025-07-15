import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pixel32_t/features/cloth/application/cloth_repository.dart';

part 'color_panel_state.dart';

class ColorPanelCubit extends Cubit<ColorPanelState> {
  ClothRepository clothRepository;
  ColorPanelCubit(this.clothRepository)
    : super(
        ColorPanelState(
          primaryColor: clothRepository.primaryColor,
          secondaryColor: clothRepository.secondaryColor,
          colorPalette: clothRepository.colorPalette,
        ),
      );

  void selectPrimaryColor(Color color) {
    clothRepository.primaryColor = color;
    emit(state.copyWith(primaryColor: color));
  }

  void selectSecondaryColor(Color color) {
    clothRepository.secondaryColor = color;
    emit(state.copyWith(secondaryColor: color));
  }

  void savePrimaryColor() {
    clothRepository.colorPalette.add(state.primaryColor);
    emit(
      state.copyWith(
        colorPalette: Set.unmodifiable(clothRepository.colorPalette),
      ),
    );
  }

  void saveSecondaryColor() {
    clothRepository.colorPalette.add(state.secondaryColor);
    emit(
      state.copyWith(
        colorPalette: Set.unmodifiable(clothRepository.colorPalette),
      ),
    );
  }
}
