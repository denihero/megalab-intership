import 'package:dartz/dartz.dart';
import 'package:mega_intern/future/home/data/model/home_model.dart';
import 'package:mega_intern/future/home/domain/entity/home_entity.dart';
import 'package:mega_intern/future/home/domain/repositories/post_repositories.dart';

import '../../../../core/error/failure.dart';

class Post {
  final PostRepository postRepositories;

  Post(this.postRepositories);

  Future<Either<Failure, List<PostModel>>> getAllPost(String token) async {
    return await postRepositories.getAllPost(token);
  }

  Future<Either<Failure, void>> likePost(String token, int id) async {
    return await postRepositories.likePost(token, id);
  }

  Future<Either<Failure, List<PostModel>>> getFavourite(String token) async {
    return await postRepositories.getFavourite(token);
  }

}
