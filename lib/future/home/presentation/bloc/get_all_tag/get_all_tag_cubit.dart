import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mega_intern/future/home/domain/usecases/get_post.dart';

import '../../../data/model/home_model.dart';

part 'get_all_tag_state.dart';

class GetAllTagCubit extends Cubit<GetAllTagState> {
  GetAllTagCubit(this.post) : super(GetAllTagInitial());

  final Post post;

  void getAllTag() async {
    emit(GetAllTagLoading());
    final tagResult = await post.getAllTag();
    tagResult.fold(
        (l) => emit(GetAllTagError()), (r) => emit(GetAllTagSuccess(r)));
  }

  @override
  void onChange(Change<GetAllTagState> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
