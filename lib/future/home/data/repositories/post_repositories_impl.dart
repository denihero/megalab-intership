import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mega_intern/core/error/exception.dart';
import 'package:mega_intern/core/error/failure.dart';
import 'package:mega_intern/future/home/data/datasources/post_data_sources.dart';
import 'package:mega_intern/future/home/data/model/home_model.dart';
import 'package:mega_intern/future/home/domain/repositories/post_repositories.dart';

class PostRepositoryImpl extends PostRepository {
  final PostDataSources postDataSourcesImpl;

  PostRepositoryImpl(this.postDataSourcesImpl);

  @override
  Future<Either<Failure, List<PostModel>>> getAllPost() async {
    try {
      final getPost = await postDataSourcesImpl.getAllPosts();
      return Right(getPost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> likePost(int id) async {
    try {
      final likePost = await postDataSourcesImpl.likePost(id);
      return Right(likePost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostModel>>> getFavourite() async {
    try {
      final getFavouritePost = await postDataSourcesImpl.getFavourite();
      return Right(getFavouritePost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUser() async {
    try {
      final getUser = await postDataSourcesImpl.getUser();
      return Right(getUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostModel>>> getOwnPost(String author) async {
    try {
      final getUser = await postDataSourcesImpl.getOwnPost(author);
      return Right(getUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<TagModel>>> getAllTag() async {
    try {
      final getTag = await postDataSourcesImpl.getAllTag();
      return Right(getTag);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostModel>>> searchPost(String query) async {
    try {
      final searchPost = await postDataSourcesImpl.searchPost(query);
      return Right(searchPost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }


  @override
  Future<Either<Failure, void>> publishPost(String text, String title, File? image, String tag) async{
    try {
      final searchPost = await postDataSourcesImpl.publishPost(title,text,image,tag);
      return Right(searchPost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
