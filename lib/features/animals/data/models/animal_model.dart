import 'dart:convert';

import 'package:tinder_cat_dog_app/features/animals/domain/entities/animal.dart';

class AnimalModel extends Animal {
  const AnimalModel({
    required String id,
    required String name,
    required String path,
  }) : super(id: id, name: name, path: path);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'path': path,
    };
  }

  factory AnimalModel.fromMap(Map<String, dynamic> map) {
    return AnimalModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      path: map['path'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimalModel.fromJson(String source) =>
      AnimalModel.fromMap(json.decode(source));
}
