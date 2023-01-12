import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_intern/future/auth/login/data/model/login_model.dart';
import 'package:mega_intern/future/auth/login/domain/usecases/login.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/storage/storage.dart';

part 'login_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.login,) : super(LoginInitial());
  final Login login;

  bool isLoading = false;

  void loginCubit(String nickname, String password) async {
    emit(LoginLoading());
    isLoading = true;
    final token = await login.login(nickname: nickname, password: password);

    token.fold((l) {
      emit(LoginError(_mapFailureToMessage(l)));
    }, (r) async {
      emit(LoginSuccess(r));
      SecureStorage.writeData(r.token!, 'mega');
      isLoading = false;
    });
  }

  String _mapFailureToMessage(DioError failure) {
    print(failure);
    return failure.error;
  }
}
