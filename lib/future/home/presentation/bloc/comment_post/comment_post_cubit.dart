import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mega_intern/future/home/domain/usecases/get_post.dart';

part 'comment_post_state.dart';

class CommentPostCubit extends Cubit<CommentPostState> {
  CommentPostCubit(this.post) : super(CommentPostInitial());

  final Post post;

  bool isLoading = false;

  void commentPost(int id, String text) async {
    emit(CommentPostLoading());
    isLoading = true;
    final commentResult = await post.commentPost(id, text);

    commentResult.fold((l) {
      emit(CommentPostError());
      isLoading = false;
    }, (r) {
      emit(CommentPostSuccess());
      isLoading = false;
    });
  }

  void commentReplyPost(int id, String text, int parentId) async {
    emit(CommentPostLoading());
    isLoading = true;
    final commentReplyResult = await post.commentReplyPost(id, text, parentId);

    commentReplyResult.fold((l) {
      isLoading = false;
      emit(CommentPostError());
    }, (r) {
      emit(CommentPostSuccess());
      isLoading = false;
    });
  }
}
