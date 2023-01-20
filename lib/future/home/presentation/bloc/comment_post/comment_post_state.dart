part of 'comment_post_cubit.dart';

abstract class CommentPostState extends Equatable {
  @override
  List<Object> get props => [];
}

class CommentPostInitial extends CommentPostState {}
class CommentPostLoading extends CommentPostState {}
class CommentPostError extends CommentPostState {}
class CommentPostSuccess extends CommentPostState {}
