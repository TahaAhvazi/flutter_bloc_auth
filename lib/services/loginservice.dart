import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginUserService {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<bool> hasToken() async {
    final value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
    print(token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future loginUser(String username, String password) async {
    Response response = await Dio().post(
      "https://reqres.in/api/register",
      data: {
        "email": username,
        "password": password,
      },
    );
    // print(response.statusCode);
    // print("----------------");
    // ignore: avoid_print
    print(response.data['token']);
  }
}
