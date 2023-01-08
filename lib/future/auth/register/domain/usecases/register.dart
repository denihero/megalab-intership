import 'package:dartz/dartz.dart';
import 'package:mega_intern/core/error/failure.dart';
import 'package:mega_intern/future/auth/register/domain/entity/auth_entity.dart';
import 'package:mega_intern/future/auth/register/domain/repositories/auth_repository.dart';

class Register {
  final AuthRepository authRepository;

  Register(this.authRepository);

  Future<Either<Failure, List<UserEntity>>>  register() async{
    return await authRepository.register();
  }

}