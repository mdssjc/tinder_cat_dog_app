import 'package:tinder_cat_dog_app/core/data/datasources/in_memory_data_source.dart';
import 'package:tinder_cat_dog_app/features/animals/data/models/vote_model.dart';
import 'package:tinder_cat_dog_app/features/animals/domain/entities/animal.dart';
import 'package:tinder_cat_dog_app/features/animals/domain/repositories/vote_repository.dart';

import '../datasources/vote_data_source.dart';

class VoteRepositoryImpl extends VoteRepository {
  @override
  Future<bool> hasLiked(Animal animal) {
    return VoteDataSource().hasLiked(animal.id);
  }

  @override
  Future<void> like(Animal animal) {
    var memory = InMemoryDataSource.instance;

    return VoteDataSource().vote(VoteModel(
      voteType: memory.getType(),
      animalId: animal.id,
      liked: true,
    ));
  }

  @override
  Future<void> dislike(Animal animal) {
    var memory = InMemoryDataSource.instance;

    return VoteDataSource().vote(VoteModel(
      voteType: memory.getType(),
      animalId: animal.id,
      liked: false,
    ));
  }
}
