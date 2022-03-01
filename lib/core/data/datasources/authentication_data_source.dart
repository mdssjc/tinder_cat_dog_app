import 'package:dog/dog.dart';
import 'package:http/http.dart' as http;
import 'package:tinder_cat_dog_app/constants.dart';
import 'package:tinder_cat_dog_app/core/error/exceptions.dart';

class AuthenticationDataSource {
  Future<String> autologin() async {
    var response = await http.post(Uri.parse('$apiBaseUrl/auth'));

    if (response.statusCode == 200) {
      return response.headers['authorization'] ?? '';
    }

    dog.e('Request failed with status: ${response.statusCode}.');
    throw ServerException();
  }
}
