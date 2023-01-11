part of 'get_all_post_cubit.dart';

abstract class GetAllPostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAllPostInitial extends GetAllPostState {}

class GetAllPostLoading extends GetAllPostState {}

class GetAllPostError extends GetAllPostState {
  final String error;

  GetAllPostError(this.error);
  @override
  List<Object?> get props => [error];
}

class GetAllPostSuccess extends GetAllPostState {
  final List<PostModel> posts;

  GetAllPostSuccess(this.posts);

  @override
  List<Object?> get props => [posts];
}
