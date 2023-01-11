part of 'like_post_cubit.dart';

abstract class LikePostState extends Equatable {
  @override
  List<Object> get props => [];
}

class LikePostInitial extends LikePostState {}
class LikePostLoading extends LikePostState {}
class LikePostError extends LikePostState {}
class LikePostSuccess extends LikePostState {}
