import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_intern/future/auth/login/data/model/login_model.dart';
import 'package:mega_intern/future/auth/login/domain/usecases/login.dart';

import '../../../../../core/error/failure.dart';

part 'login_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';

class LoginCubit extends Cubit<LoginState> {
  final Login login;
  LoginCubit(this.login) : super(LoginInitial());

  void loginCubit(String nickname, String password) async {
    emit(LoginLoading());
    final token = await login.login(nickname: nickname, password: password);

    token.fold((l) {
      emit(LoginError(_mapFailureToMessage(l)));
    }, (r) {
      emit(LoginSuccess(r));
    });
  }

  String _mapFailureToMessage(DioError failure) {
    print(failure);
    return failure.error;
  }
}
