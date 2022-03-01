import 'dart:convert';

import 'package:dog/dog.dart';
import 'package:http/http.dart' as http;
import 'package:tinder_cat_dog_app/constants.dart';
import 'package:tinder_cat_dog_app/core/data/datasources/in_memory_data_source.dart';
import 'package:tinder_cat_dog_app/core/error/exceptions.dart';
import 'package:tinder_cat_dog_app/features/animals/data/models/animal_model.dart';

class AnimalDataSource {
  Future<List<AnimalModel>> getAnimals() async {
    var memory = InMemoryDataSource.instance;

    var response =
        await http.get(Uri.parse('$apiBaseUrl/${memory.getType().name}s'));

    if (response.statusCode == 200) {
      List<dynamic> animals = json.decode(response.body);
      return animals.map((animal) => AnimalModel.fromMap(animal)).toList();
    }

    dog.e('Request failed with status: ${response.statusCode}.');
    throw ServerException();
  }
}
