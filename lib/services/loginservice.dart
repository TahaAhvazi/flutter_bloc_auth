import 'package:dio/dio.dart';

class LoginUserService {
  Future<void> loginUser(String username, String password) async {
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
