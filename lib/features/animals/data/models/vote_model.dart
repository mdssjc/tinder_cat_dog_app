import 'dart:convert';

import 'package:tinder_cat_dog_app/core/domain/entities/animal_type.dart';

import '../../domain/entities/vote.dart';

class VoteModel extends Vote {
  final int? id;
  final int? userId;
  final AnimalType voteType;
  final String animalId;
  final bool liked;

  const VoteModel({
    this.id,
    this.userId,
    required this.voteType,
    required this.animalId,
    required this.liked,
  }) : super(voteType: voteType, animalId: animalId, liked: liked);

  Map<String, dynamic> toMap() {
    return {
      'vote_type': voteType.name,
      'animal_id': animalId,
      'liked': liked,
    };
  }

  factory VoteModel.fromMap(Map<String, dynamic> map) {
    return VoteModel(
      id: map['id'],
      userId: map['user_id'],
      voteType: map['vote_type'] == 'cat' ? AnimalType.cat : AnimalType.dog,
      animalId: map['animal_id'] ?? '',
      liked: map['liked'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory VoteModel.fromJson(String source) =>
      VoteModel.fromMap(json.decode(source));
}
