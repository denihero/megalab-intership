import 'package:dartz/dartz.dart';
import 'package:mega_intern/core/error/failure.dart';
import 'package:mega_intern/future/auth/register/domain/entity/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, List<UserEntity>>> register();
}