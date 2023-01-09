import 'package:dartz/dartz.dart';
import 'package:mega_intern/core/error/failure.dart';
import 'package:mega_intern/future/auth/register/data/model/user_model.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegisterModel>> register(
      {required String name,
      required String surname,
      required String nickname,
      required String password,
      required String password2});
}
