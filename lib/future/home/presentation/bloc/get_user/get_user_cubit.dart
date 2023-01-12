import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mega_intern/future/home/data/model/home_model.dart';

import '../../../domain/usecases/get_post.dart';

part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit(this.post) : super(GetUserInitial());

  final Post post;
  void getUser() async {
    emit(GetUserLoading());
    final getUserResponse = await post.getUser();
    getUserResponse.fold((l) => emit(GetUserError(l.toString())),
        (r) => emit(GetUserSuccess(r)));
  }
}
