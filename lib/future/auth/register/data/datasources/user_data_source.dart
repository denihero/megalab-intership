import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mega_intern/future/auth/register/data/model/user_model.dart';

abstract class UserDataSource {
  Future<UserModel> register(
      {required String name,
      required String surname,
      required String nickname,
      required String password,
      required String password2});
}

class UserDataSourceImpl extends UserDataSource {
  final Dio client;

  UserDataSourceImpl({required this.client});

  @override
  Future<UserModel> register(
      {required String name,
      required String surname,
      required String nickname,
      required String password,
      required String password2}) async {
    final userData = FormData.fromMap({
      'nickname': nickname,
      'name': name,
      'last_name': surname,
      'profile_image': '',
      'password': password,
      'password2': password2,
    });
    final response =
        await client.post('https://megalab.pythonanywhere.com/registration/',
            options: Options(
              headers: {
                'Content-Type': 'multipart/form-data',
              },
            ),
            data: userData);

    if (response.statusCode! >= 400) {
      throw Exception();
    } else if (response.statusCode! >= 200) {
      print(UserModel.fromJson(response.data));
      return UserModel.fromJson(response.data);
    }
    return response.data;
  }
}
