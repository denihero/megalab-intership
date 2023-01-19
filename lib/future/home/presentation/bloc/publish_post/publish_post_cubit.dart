import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mega_intern/future/home/domain/usecases/get_post.dart';

part 'publish_post_state.dart';

class PublishPostCubit extends Cubit<PublishPostState> {
  PublishPostCubit(this.post) : super(PublishPostInitial());

  final Post post;

  bool isLoading = false;

  Future<void> publishPost(String title, String text, File? image, String tag) async {
    emit(PublishPostLoading());
    isLoading = true;
    final publishResult = await post.publishPost(title, text, image, tag);

    publishResult.fold((l) {
      emit(PublishPostError(l.toString()));
      isLoading = false;
    }, (r) {
      emit(PublishPostSuccess());
      isLoading = false;
    });
  }
}
