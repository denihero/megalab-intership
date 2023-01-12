import 'package:dartz/dartz.dart';
import 'package:mega_intern/future/home/data/model/home_model.dart';
import 'package:mega_intern/future/home/domain/entity/home_entity.dart';
import 'package:mega_intern/future/home/domain/repositories/post_repositories.dart';

import '../../../../core/error/failure.dart';

class Post {
  final PostRepository postRepositories;

  Post(this.postRepositories);

  Future<Either<Failure, List<PostModel>>> getAllPost() async {
    return await postRepositories.getAllPost();
  }

  Future<Either<Failure, void>> likePost(int id) async {
    return await postRepositories.likePost(id);
  }

  Future<Either<Failure, List<PostModel>>> getFavourite() async {
    return await postRepositories.getFavourite();
  }

}
