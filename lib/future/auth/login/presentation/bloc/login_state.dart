part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginModel loginModel;

  LoginSuccess(this.loginModel);

  @override
  List<Object> get props => [loginModel];
}

class LoginError extends LoginState {
  final String error;

  LoginError(this.error);

  @override
  List<Object> get props => [error];
}
