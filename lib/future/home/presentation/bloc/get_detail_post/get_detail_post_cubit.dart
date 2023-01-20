import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mega_intern/future/home/data/model/home_model.dart';
import 'package:mega_intern/future/home/domain/usecases/get_post.dart';

part 'get_detail_post_state.dart';

class GetDetailPostCubit extends Cubit<GetDetailPostState> {
  GetDetailPostCubit(this.post) : super(GetDetailPostInitial());

  final Post post;

  Future<void> getDetailPost(int id) async{
    emit(GetDetailPostLoading());
    final detailPostResult = await post.getDetailPost(id);

    detailPostResult.fold((l) {
      emit(GetDetailPostError());
    }, (r) {
      emit(GetDetailPostSuccess(r));
    });
  }
}
