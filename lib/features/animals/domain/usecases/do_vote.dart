import 'package:tinder_cat_dog_app/features/animals/domain/entities/animal.dart';
import 'package:tinder_cat_dog_app/features/animals/domain/repositories/vote_repository.dart';

class DoVote {
  final VoteRepository repository;

  DoVote(this.repository);

  Future<bool> hasLiked(Animal animal) {
    return repository.hasLiked(animal);
  }

  Future<void> like(Animal animal) {
    return repository.like(animal);
  }

  Future<void> dislike(Animal animal) {
    return repository.dislike(animal);
  }
}
