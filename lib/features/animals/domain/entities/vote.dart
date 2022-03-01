import 'package:equatable/equatable.dart';
import 'package:tinder_cat_dog_app/core/domain/entities/animal_type.dart';

class Vote extends Equatable {
  final AnimalType voteType;
  final String animalId;
  final bool liked;

  const Vote({
    required this.voteType,
    required this.animalId,
    required this.liked,
  });

  @override
  List<Object> get props => [voteType, animalId, liked];
}
