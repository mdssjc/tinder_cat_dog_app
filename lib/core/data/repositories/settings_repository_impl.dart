import 'package:tinder_cat_dog_app/core/data/datasources/in_memory_data_source.dart';
import 'package:tinder_cat_dog_app/core/domain/entities/animal_type.dart';
import 'package:tinder_cat_dog_app/core/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  @override
  AnimalType getType() {
    var memory = InMemoryDataSource.instance;
    return memory.getType();
  }

  @override
  void saveType(AnimalType type) {
    var memory = InMemoryDataSource.instance;
    memory.saveType(type);
  }
}
