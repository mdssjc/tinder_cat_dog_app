import 'dart:convert';

import 'package:dog/dog.dart';
import 'package:http/http.dart' as http;
import 'package:tinder_cat_dog_app/constants.dart';
import 'package:tinder_cat_dog_app/core/data/datasources/authentication_data_source.dart';
import 'package:tinder_cat_dog_app/core/data/datasources/in_memory_data_source.dart';
import 'package:tinder_cat_dog_app/core/error/exceptions.dart';

import '../models/vote_model.dart';

class VoteDataSource {
  Future<bool> hasLiked(String animalId) async {
    var headers = await _getHeader();

    var response = await http.get(
      Uri.parse('$apiBaseUrl/votes'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      List<dynamic> votes = json.decode(response.body);
      List<VoteModel> selectedVotes = votes
          .map((vote) => VoteModel.fromMap(vote))
          .where((vote) => vote.animalId == animalId)
          .toList();

      return selectedVotes.isEmpty ? false : selectedVotes.first.liked;
    }

    dog.e('Request failed with status: ${response.statusCode}.');
    throw ServerException();
  }

  Future<void> vote(VoteModel vote) async {
    var headers = await _getHeader();

    var response = await http.post(
      Uri.parse('$apiBaseUrl/votes'),
      headers: headers,
      body: vote.toJson(),
    );

    if (response.statusCode != 201) {
      dog.e('Request failed with status: ${response.statusCode}.');
      throw ServerException();
    }
  }

  Future<Map<String, String>> _getHeader() async {
    var login = await _autologin();

    return {
      'Authorization': login,
      'Content-Type': 'application/json',
    };
  }

  Future<String> _autologin() async {
    var memory = InMemoryDataSource.instance;

    if (memory.getLogin().isEmpty) {
      var login = AuthenticationDataSource().autologin();
      memory.saveLogin(await login);
    }

    return memory.getLogin();
  }
}
