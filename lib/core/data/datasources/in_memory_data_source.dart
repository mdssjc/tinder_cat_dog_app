import 'package:tinder_cat_dog_app/core/domain/entities/animal_type.dart';

class InMemoryDataSource {
  Map<String, dynamic> memory = {};

  static final InMemoryDataSource _instance = InMemoryDataSource._();

  InMemoryDataSource._();

  static InMemoryDataSource get instance => _instance;

  String getLogin() {
    return memory['login'] ?? '';
  }

  void saveLogin(String login) {
    memory['login'] = login;
  }

  AnimalType getType() {
    return memory['type'] ?? AnimalType.cat;
  }

  void saveType(AnimalType type) {
    memory['type'] = type;
  }
}
