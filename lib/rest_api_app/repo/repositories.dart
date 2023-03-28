import 'dart:convert';
import 'package:flutter_rest_api/rest_api_app/models/user_model.dart';
import 'package:http/http.dart';

class UserRepository {
  String userUrl = 'https://reqres.in/api/users?page=2';
  Future<List<UserModel>> getUser() async {
    final response = await get(Uri.parse(userUrl));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)['data'] as List<dynamic>;

      return result
          .map(
            (dynamic item) => UserModel.fromJson(item as Map<String, dynamic>),
          )
          .toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
