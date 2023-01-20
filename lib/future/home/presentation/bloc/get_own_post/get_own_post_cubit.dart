import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/home_model.dart';
import '../../../domain/usecases/get_post.dart';

part 'get_own_post_state.dart';

class GetOwnPostCubit extends Cubit<GetOwnPostState> {
  GetOwnPostCubit(this.post) : super(GetOwnPostInitial());

  final Post post;

  Future<void> getOwnPostCubit(String author) async {
    emit(GetOwnPostLoading());
    final getOwnResult = await post.getOwnPost(author);
    getOwnResult.fold(
        (l) => emit(GetOwnPostError()), (r) => emit(GetOwnPostSuccess(r)));
  }
}
