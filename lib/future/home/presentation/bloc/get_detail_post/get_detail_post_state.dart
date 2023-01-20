part of 'get_detail_post_cubit.dart';

abstract class GetDetailPostState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetDetailPostInitial extends GetDetailPostState {}

class GetDetailPostLoading extends GetDetailPostState {}

class GetDetailPostError extends GetDetailPostState {}

class GetDetailPostSuccess extends GetDetailPostState {
  GetDetailPostSuccess(this.detailPost);

  final PostModel detailPost;

  @override
  List<Object> get props => [detailPost];
}
