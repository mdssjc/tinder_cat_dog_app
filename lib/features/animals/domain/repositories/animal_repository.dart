import 'package:tinder_cat_dog_app/features/animals/domain/entities/animal.dart';

abstract class AnimalRepository {
  Future<List<Animal>> getAnimals();
}
