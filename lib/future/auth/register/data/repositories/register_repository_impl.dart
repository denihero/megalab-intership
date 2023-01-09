import 'package:dartz/dartz.dart';
import 'package:mega_intern/core/error/exception.dart';
import 'package:mega_intern/core/error/failure.dart';
import 'package:mega_intern/future/auth/register/data/datasources/user_data_source.dart';
import 'package:mega_intern/future/auth/register/data/model/user_model.dart';
import 'package:mega_intern/future/auth/register/domain/entity/register_entity.dart';
import 'package:mega_intern/future/auth/register/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  final RegisterDataSource userDataSource;

  RegisterRepositoryImpl(this.userDataSource);

  @override
  Future<Either<Failure, RegisterModel>> register(
      {required String name,
      required String surname,
      required String nickname,
      required String password,
      required String password2}) async {
    try {
      final register = await userDataSource.register(
          name: name,
          surname: surname,
          nickname: nickname,
          password: password,
          password2: password2);
      return Right(register);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
