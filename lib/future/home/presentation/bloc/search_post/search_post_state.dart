part of 'search_post_cubit.dart';

@immutable
abstract class SearchPostState extends Equatable{
  @override
  List<Object?> get props => [];
}

class SearchPostInitial extends SearchPostState {}
class SearchPostLoading extends SearchPostState {}
class SearchPostError extends SearchPostState {}
class SearchPostSuccess extends SearchPostState {

  SearchPostSuccess(this.searchResult);

  final List<PostModel> searchResult;

  @override
  List<Object?> get props => [searchResult];


}
