import 'package:tinder_cat_dog_app/features/animals/data/datasources/animal_data_source.dart';
import 'package:tinder_cat_dog_app/features/animals/domain/entities/animal.dart';
import 'package:tinder_cat_dog_app/features/animals/domain/repositories/animal_repository.dart';

class AnimalRepositoryImpl extends AnimalRepository {
  @override
  Future<List<Animal>> getAnimals() {
    return AnimalDataSource().getAnimals();
  }
}
