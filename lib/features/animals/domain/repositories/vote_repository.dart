import 'package:tinder_cat_dog_app/features/animals/domain/entities/animal.dart';

abstract class VoteRepository {
  Future<bool> hasLiked(Animal animal);

  Future<void> like(Animal animal);

  Future<void> dislike(Animal animal);
}
