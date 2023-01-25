import 'package:dio/dio.dart';
import 'package:mega_intern/future/auth/login/data/model/login_model.dart';

abstract class LoginDataSource {
  Future<LoginModel> login(
      {required String nickname, required String password});
}

class LoginDataSourceImpl extends LoginDataSource {
  final Dio client;

  LoginDataSourceImpl({required this.client});

  @override
  Future<LoginModel> login(
      {required String nickname, required String password}) async {
    final response =
        await client.post('https://megalab.pythonanywhere.com/login/',
            options: Options(headers: {
              'Content-Type': 'application/json',
            }),
            data: {
          'nickname': nickname,
          'password': password,
        });

    if (response.statusCode! == 400) {
      print(response.data);
      throw response.data['non_field_errors'];
    } else if (response.statusCode! >= 200) {
      print(LoginModel.fromJson(response.data));
      return LoginModel.fromJson(response.data);
    }
    return LoginModel.fromJson(response.data);
  }
}
