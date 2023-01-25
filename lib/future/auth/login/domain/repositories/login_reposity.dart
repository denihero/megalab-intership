import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mega_intern/future/auth/login/data/model/login_model.dart';

abstract class LoginRepository {
  Future<Either<DioError, LoginModel>> login({required String nickname,required String password});
}