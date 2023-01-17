part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoading extends RegisterState {
  final bool isLoading;

  RegisterLoading(this.isLoading);

  @override
  List<Object> get props => [isLoading];
}

class RegisterLoaded extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterError extends RegisterState {
  RegisterError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
