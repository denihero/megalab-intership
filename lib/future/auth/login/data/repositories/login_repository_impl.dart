import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mega_intern/future/auth/login/data/datasources/login_data_sources.dart';
import 'package:mega_intern/future/auth/login/data/model/login_model.dart';
import 'package:mega_intern/future/auth/login/domain/repositories/login_reposity.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginDataSource loginDataSource;

  LoginRepositoryImpl(this.loginDataSource);
  @override
  Future<Either<DioError, LoginModel>> login(
      {required String nickname, required String password}) async {
    try {
      final login =
          await loginDataSource.login(nickname: nickname, password: password);
      return Right(login);
    } on DioError catch(e){
      return Left(e);
    }
  }
}
