import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_intern/future/home/data/model/home_model.dart';

import '../../../domain/usecases/get_post.dart';

part 'get_favourite_state.dart';

class GetFavouriteCubit extends Cubit<GetFavouriteState> {
  GetFavouriteCubit(this.post) : super(GetFavouriteInitial());

  final Post post;

  void getFavourite(String token) async {
    emit(GetFavouriteLoading());
    final responseGetFav = await post.getFavourite(token);

    responseGetFav.fold((l) => emit(GetFavouriteError(l.toString())),
        (r) => emit(GetFavouriteSuccess(r)));
  }
}
