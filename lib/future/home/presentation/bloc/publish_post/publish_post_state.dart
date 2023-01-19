part of 'publish_post_cubit.dart';

abstract class PublishPostState extends Equatable {
  @override
  List<Object> get props => [];
}

class PublishPostInitial extends PublishPostState {}

class PublishPostError extends PublishPostState {
  PublishPostError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}

class PublishPostLoading extends PublishPostState {}

class PublishPostSuccess extends PublishPostState {}
