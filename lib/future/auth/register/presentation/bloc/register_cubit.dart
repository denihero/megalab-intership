import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_intern/future/auth/register/data/datasources/user_data_source.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.userDataSourceImpl) : super(RegisterInitial());

  UserDataSourceImpl userDataSourceImpl;

  void registerCubit(
      {required String name,
      required String surname,
      required String nickname,
      required String password,
      required String password2}) async {
    emit(RegisterLoading());
    try {
      await userDataSourceImpl.register(
          name: name,
          surname: surname,
          nickname: nickname,
          password: password,
          password2: password2);
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterError());
    }
  }
}
