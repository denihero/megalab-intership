import 'package:dartz/dartz.dart';
import 'package:mega_intern/core/error/failure.dart';
import 'package:mega_intern/future/home/data/model/home_model.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostModel>>> getAllPost(String token);
  Future<Either<Failure, void>> likePost(String token,int id);
  Future<Either<Failure, List<PostModel>>> getFavourite(String token);
  // Future<Either<Failure, PostModel>> publicPost();
  // Future<Either<Failure, PostModel>> deletePost();
}
