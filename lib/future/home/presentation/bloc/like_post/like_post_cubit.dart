import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mega_intern/future/home/domain/usecases/get_post.dart';

part 'like_post_state.dart';

class LikePostCubit extends Cubit<LikePostState> {
  LikePostCubit(this.post) : super(LikePostInitial());

  final Post post;

  Future<void> likePost(String token, int id) async {
    emit(LikePostLoading());
    final responseLike = await post.likePost(token, id);
    responseLike.fold(
        (l) => emit(LikePostError()), (r) => emit(LikePostSuccess()));
  }
}
