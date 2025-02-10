import 'package:dio/dio.dart';

import '../models/user_model.dart';

class AuthRepository {
  final Dio dio = Dio();

  Future<UserModel> login(String identifier, String password) async {
    try {
      final response = await dio.post(
        'https://illuminate-production.up.railway.app/api/auth/local',
        data: {"identifier": identifier, "password": password},
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception("Login failed: ${e.toString()}");
    }
  }
}
