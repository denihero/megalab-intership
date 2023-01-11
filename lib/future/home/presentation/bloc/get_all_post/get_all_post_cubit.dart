import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mega_intern/future/home/data/model/home_model.dart';

import '../../../domain/usecases/get_post.dart';

part 'get_all_post_state.dart';

class GetAllPostCubit extends Cubit<GetAllPostState> {

  GetAllPostCubit(this.post) : super(GetAllPostInitial());

  final Post post;


  void getAllPosts(String token) async {
    emit(GetAllPostLoading());
    final postsResult = await post.getAllPost(token);

    postsResult.fold((l) => emit(GetAllPostError(l.toString())),
        (r) => emit(GetAllPostSuccess(r)));
  }
}
