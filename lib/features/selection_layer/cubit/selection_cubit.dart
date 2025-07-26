import 'package:bloc/bloc.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';
import 'package:pixel32_t/features/selection_layer/selection_layer.dart';

class SelectionCubit extends Cubit<SelectionLayer> {
  SelectionCubit(ClothRepository repository) : super(repository.selectionLayer);

  void commit() {
    emit(state.copyWith());
  }

  void selectAll() {
    state.selectAll();
    commit();
  }

  void deselectAll() {
    state.deselectAll();
    commit();
  }

  void invertSelection() {
    state.invert();
    commit();
  }
}
