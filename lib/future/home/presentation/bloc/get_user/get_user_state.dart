part of 'get_user_cubit.dart';

abstract class GetUserState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetUserInitial extends GetUserState {}

class GetUserError extends GetUserState {
  GetUserError(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}

class GetUserLoading extends GetUserState {}

class GetUserSuccess extends GetUserState {
  GetUserSuccess(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}
