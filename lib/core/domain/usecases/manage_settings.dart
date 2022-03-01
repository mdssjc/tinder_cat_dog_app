import 'package:tinder_cat_dog_app/core/domain/entities/animal_type.dart';

import '../repositories/settings_repository.dart';

class ManageSettings {
  final SettingsRepository repository;

  const ManageSettings(this.repository);

  AnimalType getType() {
    return repository.getType();
  }

  void saveType(AnimalType type) {
    repository.saveType(type);
  }
}
