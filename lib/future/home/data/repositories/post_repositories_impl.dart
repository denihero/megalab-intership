import 'package:dartz/dartz.dart';
import 'package:mega_intern/core/error/exception.dart';
import 'package:mega_intern/core/error/failure.dart';
import 'package:mega_intern/future/home/data/datasources/post_data_sources.dart';
import 'package:mega_intern/future/home/data/model/home_model.dart';
import 'package:mega_intern/future/home/domain/entity/home_entity.dart';
import 'package:mega_intern/future/home/domain/repositories/post_repositories.dart';

class PostRepositoryImpl extends PostRepository {
  final PostDataSources postDataSourcesImpl;

  PostRepositoryImpl(this.postDataSourcesImpl);

  @override
  Future<Either<Failure, List<PostModel>>> getAllPost(String token) async {
    try {
      final getPost = await postDataSourcesImpl.getAllPosts(token);
      return Right(getPost);
    } on ServerException {
      return Left(ServerFailure());
    } 
  }

  @override
  Future<Either<Failure, void>> likePost(String token, int id) async {
    try {
      final likePost = await postDataSourcesImpl.likePost(token, id);
      return Right(likePost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostModel>>> getFavourite(String token) async{
    try {
      final getFavouritePost = await postDataSourcesImpl.getFavourite(token);
      return Right(getFavouritePost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
