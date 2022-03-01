part of 'animal_cubit.dart';

abstract class AnimalState extends Equatable {
  const AnimalState();

  @override
  List<Object> get props => [];
}

class AnimalInitial extends AnimalState {}

class AnimalLoadInProgress extends AnimalState {}

class AnimalLoadSuccess extends AnimalState {
  final List<Animal> animals;

  const AnimalLoadSuccess(this.animals);
}

class AnimalLoadInFailure extends AnimalState {
  final String message;

  const AnimalLoadInFailure(this.message);
}
