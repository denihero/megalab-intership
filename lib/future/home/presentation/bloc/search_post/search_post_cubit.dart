import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mega_intern/future/home/data/model/home_model.dart';
import 'package:mega_intern/future/home/domain/usecases/get_post.dart';
import 'package:meta/meta.dart';

part 'search_post_state.dart';

class SearchPostCubit extends Cubit<SearchPostState> {
  SearchPostCubit(this.post) : super(SearchPostInitial());

  final Post post;

  void searchPost(String query) async {
    emit(SearchPostLoading());

    final searchResult = await post.getAllPost();

    searchResult.fold((l) => emit(SearchPostError()), (r) {
      final filteredText = r
          .where((element) =>
              element.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(SearchPostSuccess(filteredText));
    });
  }
}
