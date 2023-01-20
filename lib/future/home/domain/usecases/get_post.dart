import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mega_intern/future/home/data/model/home_model.dart';
import 'package:mega_intern/future/home/domain/repositories/post_repositories.dart';

import '../../../../core/error/failure.dart';

class Post {
  final PostRepository postRepositories;

  Post(this.postRepositories);

  Future<Either<Failure, List<PostModel>>> getAllPost() async {
    return await postRepositories.getAllPost();
  }

  Future<Either<Failure, PostModel>> getDetailPost(int id) async {
    return await postRepositories.getDetailPost(id);
  }

  Future<Either<Failure, List<PostModel>>> searchPost(String query) async {
    return await postRepositories.searchPost(query);
  }

  Future<Either<Failure, void>> likePost(int id) async {
    return await postRepositories.likePost(id);
  }

  Future<Either<Failure, void>> publishPost(
      String title, String text, File? image, String tag) async {
    return await postRepositories.publishPost(text, title, image, tag);
  }

  Future<Either<Failure, void>> commentPost(int id, String text) async {
    return await postRepositories.commentPost(id, text);
  }

  Future<Either<Failure, void>> commentReplyPost(
    int id,
    String text,
    int parentId,
  ) async {
    return await postRepositories.commentReplyPost(id, text, parentId);
  }

  Future<Either<Failure, List<PostModel>>> getFavourite() async {
    return await postRepositories.getFavourite();
  }

  Future<Either<Failure, List<PostModel>>>  getOwnPost(String author) async {
    return await postRepositories.getOwnPost(author);
  }

  Future<Either<Failure, List<TagModel>>> getAllTag() async {
    return await postRepositories.getAllTag();
  }

  Future<Either<Failure, UserModel>> getUser() async {
    return await postRepositories.getUser();
  }
}
