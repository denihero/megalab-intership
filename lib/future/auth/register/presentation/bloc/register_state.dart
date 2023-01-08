part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}
class RegisterLoading extends RegisterState {}
class RegisterLoaded extends RegisterState {}
class RegisterSuccess extends RegisterState {}
class RegisterError extends RegisterState {}
