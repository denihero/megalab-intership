import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mega_intern/future/auth/login/domain/repositories/login_reposity.dart';

import '../../data/model/login_model.dart';

class Login {
  final LoginRepository loginRepository;

  Login(this.loginRepository);

  Future<Either<DioError, LoginModel>> login(
      {required String nickname, required String password}) async {
    return await loginRepository.login(nickname: nickname, password: password);
  }
}
