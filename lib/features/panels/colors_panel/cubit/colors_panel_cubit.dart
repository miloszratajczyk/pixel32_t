import 'dart:collection';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixel32_t/features/tools/core/repo/tool_repository.dart';

part 'colors_panel_state.dart';
part 'colors_panel_cubit.freezed.dart';

class ColorsPanelCubit extends Cubit<ColorsPanelState> {
  ColorsPanelCubit(ToolRepository toolRepository)
    : _toolRepository = toolRepository,
      super(
        ColorsPanelState(
          primaryColor: toolRepository.primaryColor,
          secondaryColor: toolRepository.secondaryColor,
          colorPalette: toolRepository.colorPalette,
        ),
      );

  final ToolRepository _toolRepository;

  /// Sets the primary color in the `ToolRepository` and updates the state
  void setPrimaryColor(Color color) {
    _toolRepository.primaryColor = color;
    emit(state.copyWith(primaryColor: color));
  }

  /// Sets the secondary color in the `ToolRepository` and updates the state
  void setSecondaryColor(Color color) {
    _toolRepository.secondaryColor = color;
    emit(state.copyWith(secondaryColor: color));
  }

  /// Adds the current primary color to the `ToolRepository` color palette and updates the state
  void savePrimaryColor() {
    _toolRepository.colorPalette = [...state.colorPalette, state.primaryColor];
    emit(state.copyWith(colorPalette: _toolRepository.colorPalette));
  }

  /// Adds the current secondary color to the `ToolRepository` color palette and updates the state
  void saveSecondaryColor() {
    _toolRepository.colorPalette = [
      ...state.colorPalette,
      state.secondaryColor,
    ];
    emit(state.copyWith(colorPalette: _toolRepository.colorPalette));
  }
}
