part of 'cloth_bloc.dart';

sealed class ClothState extends Equatable {
  const ClothState();
  
  @override
  List<Object> get props => [];
}

final class ClothInitial extends ClothState {}
