import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_intern/future/auth/register/domain/usecases/register.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.register) : super(RegisterInitial());

  final Register register;

  bool isLoading = false;

  void registerCubit(
      {required String name,
      required String surname,
      required String nickname,
      required String password,
      required String password2}) async {
    emit(RegisterLoading(isLoading));
    isLoading = true;

    final registerResult = await register.register(
        name: name,
        surname: surname,
        nickname: nickname,
        password: password,
        password2: password2);
    registerResult.fold((l) {
      emit(RegisterError());
      isLoading = false;
    }, (r) {
      emit(RegisterSuccess());
      isLoading = false;
    });
  }
}
