import 'package:tinder_cat_dog_app/features/animals/domain/entities/animal.dart';

import '../repositories/animal_repository.dart';

class GetAnimal {
  final AnimalRepository repository;

  const GetAnimal(this.repository);

  Future<List<Animal>> listAll() {
    return repository.getAnimals();
  }
}
