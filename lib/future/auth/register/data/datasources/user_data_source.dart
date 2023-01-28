
import 'package:dio/dio.dart';
import 'package:mega_intern/core/error/failure.dart';
import 'package:mega_intern/core/network/api/dio_client.dart';
import 'package:mega_intern/future/auth/register/data/model/user_model.dart';

abstract class RegisterDataSource {
  Future<RegisterModel> register(
      {required String name,
      required String surname,
      required String nickname,
      required String password,
      required String password2});
}

class RegisterDataSourceImpl extends RegisterDataSource {
  final DioClient client;

  RegisterDataSourceImpl({required this.client});

  @override
  Future<RegisterModel> register(
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
    final response = await client.postFixed('/registration/',
        data: userData, isFormData: true);

    if (response.statusCode! >= 400) {
      throw ServerFailure();
    } else if (response.statusCode! >= 200) {
      return RegisterModel.fromJson(response.data);
    }
    return RegisterModel.fromJson(response.data);
  }
}
