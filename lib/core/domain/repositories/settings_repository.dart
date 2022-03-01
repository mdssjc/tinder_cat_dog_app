import 'package:tinder_cat_dog_app/core/domain/entities/animal_type.dart';

abstract class SettingsRepository {
  AnimalType getType();

  void saveType(AnimalType type);
}
