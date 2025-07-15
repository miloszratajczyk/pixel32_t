import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cloth_event.dart';
part 'cloth_state.dart';

class ClothBloc extends Bloc<ClothEvent, ClothState> {
  ClothBloc() : super(ClothInitial()) {
    on<ClothEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
