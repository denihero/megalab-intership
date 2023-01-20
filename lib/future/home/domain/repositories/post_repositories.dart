import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mega_intern/core/error/failure.dart';
import 'package:mega_intern/future/home/data/model/home_model.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostModel>>> getAllPost();
  Future<Either<Failure, PostModel>> getDetailPost(int id);
  Future<Either<Failure, List<PostModel>>> searchPost(String query);
  Future<Either<Failure, void>> likePost(int id);
  Future<Either<Failure, void>> commentPost(int id,String text);
  Future<Either<Failure, void>> commentReplyPost(int id,String text,int parentId);
  Future<Either<Failure, void>> publishPost(String text,String title,File? image,String tag);
  Future<Either<Failure, List<PostModel>>> getFavourite();
  Future<Either<Failure, List<PostModel>>> getOwnPost(String author);
  Future<Either<Failure, List<TagModel>>> getAllTag();
  Future<Either<Failure, UserModel>> getUser();
  // Future<Either<Failure, PostModel>> publicPost();
  // Future<Either<Failure, PostModel>> deletePost();
}
