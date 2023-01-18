part of 'get_all_tag_cubit.dart';

abstract class GetAllTagState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAllTagInitial extends GetAllTagState {}

class GetAllTagLoading extends GetAllTagState {}

class GetAllTagError extends GetAllTagState {}

class GetAllTagSuccess extends GetAllTagState {
  GetAllTagSuccess(this.allTag);

  final List<TagModel> allTag;

  @override
  List<Object> get props => [allTag];
}
