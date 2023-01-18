part of 'get_own_post_cubit.dart';

abstract class GetOwnPostState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetOwnPostInitial extends GetOwnPostState {}

class GetOwnPostError extends GetOwnPostState {}

class GetOwnPostLoading extends GetOwnPostState {}

class GetOwnPostSuccess extends GetOwnPostState {
  GetOwnPostSuccess(this.ownPost);
  final List<PostModel> ownPost;
  @override
  List<Object> get props => [ownPost];
}
