import 'package:bloc_api/plugins/json_parser.dart';

import '../models/user.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  String baseUrl = 'https://reqres.in/api/users';

  Future<User?> getSingleUser(int userId) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/$userId"));
      final data = JsonParser.tryDecode(response.body);
      return User.fromJson(data?['data']);
    } catch (e) {
      rethrow;
    }
  }
}
