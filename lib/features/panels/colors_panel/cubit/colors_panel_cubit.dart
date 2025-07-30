import 'dart:collection';
import 'dart:ui';

import 'package:bloc/bloc.dart';
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

  void setPrimaryColor(Color color) {
    _toolRepository.primaryColor = color;
    emit(state.copyWith(primaryColor: color));
  }

  void setSecondaryColor(Color color) {
    _toolRepository.secondaryColor = color;
    emit(state.copyWith(secondaryColor: color));
  }

  void savePrimaryColor() {
    emit(
      state.copyWith(
        colorPalette: UnmodifiableListView([
          ...state.colorPalette,
          state.primaryColor,
        ]),
      ),
    );
  }

  void saveSecondaryColor() {
    emit(
      state.copyWith(
        colorPalette: UnmodifiableListView([
          ...state.colorPalette,
          state.primaryColor,
        ]),
      ),
    );
  }
}
