import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mega_intern/core/common/string.dart';
import 'package:mega_intern/core/error/failure.dart';
import 'package:mega_intern/core/network/api/dio_client.dart';
import 'package:mega_intern/future/home/data/model/home_model.dart';

abstract class PostDataSources {
  Future<List<PostModel>> getAllPosts();
  Future<PostModel> getDetailPost(int id);
  Future<List<PostModel>> searchPost(String query);
  Future<List<PostModel>> getFavourite();
  Future<void> publishPost(String title, String text, File? image, String tag);
  Future<List<PostModel>> getOwnPost(String author);
  Future<List<TagModel>> getAllTag();
  Future<void> likePost(int id);
  Future<void> commentPost(int id, String text);
  Future<void> commentReplyPost(int id, String text, int parentId);
  Future<UserModel> getUser();

  //Future<void> deletePost(int id);
}

class PostDataSourcesImpl extends PostDataSources {
  final DioClient client;

  PostDataSourcesImpl({required this.client});

  @override
  Future<List<PostModel>> getAllPosts() async {
    final List<PostModel> ls = [];
    final response = await client.getFixed('/post/');

    if (response.statusCode! >= 400) {
      throw ServerFailure();
    } else if (response.statusCode! >= 200) {
      for (var item in response.data) {
        ls.add(PostModel.fromJson(item));
      }
      return ls;
    }

    return ls;
  }

  @override
  Future<void> likePost(int id) async {
    final responseLike = await client.postFixed('/like/', data: {'post': id});

    if (responseLike.statusCode! >= 400) {
      throw ServerFailure();
    } else if (responseLike.statusCode! >= 200) {
      return responseLike.data;
    }
  }

  @override
  Future<List<PostModel>> getFavourite() async {
    final List<PostModel> ls = [];
    final response = await client.getFixed('/like/');

    if (response.statusCode! >= 400) {
      throw ServerFailure();
    } else if (response.statusCode! >= 200) {
      for (var item in response.data) {
        ls.add(PostModel.fromJson(item));
      }
      return ls;
    }

    return ls;
  }

  @override
  Future<UserModel> getUser() async {
    final response = await client.getFixed('/user/');

    if (response.statusCode! >= 400) {
      throw ServerFailure();
    } else if (response.statusCode! >= 200) {
      return UserModel.fromJson(response.data);
    }

    return UserModel.fromJson(response.data);
  }

  @override
  Future<List<PostModel>> getOwnPost(String author) async {
    final List<PostModel> ls = [];
    final response = await client.getFixed('/post/?author=$author');

    if (response.statusCode! >= 400) {
      throw ServerFailure();
    } else if (response.statusCode! >= 200) {
      for (var item in response.data) {
        ls.add(PostModel.fromJson(item));
      }
      return ls;
    }

    return ls;
  }

  @override
  Future<List<TagModel>> getAllTag() async {
    final List<TagModel> ls = [];
    final response = await client.getFixed('/tag/');

    if (response.statusCode! >= 400) {
      throw ServerFailure();
    } else if (response.statusCode! >= 200) {
      for (var item in response.data) {
        ls.add(TagModel.fromJson(item));
      }
      return ls;
    }

    return ls;
  }

  @override
  Future<List<PostModel>> searchPost(String query) async {
    final List<PostModel> ls = [];
    final response = await client.getFixed('/post/?search=$query');

    if (response.statusCode! >= 400) {
      throw ServerFailure();
    } else if (response.statusCode! >= 200) {
      for (var item in response.data) {
        ls.add(PostModel.fromJson(item));
      }
      return ls;
    }

    return ls;
  }

  @override
  Future<void> publishPost(
      String title, String text, File? image, String tag) async {
    final postData = FormData.fromMap({
      'title': title,
      'text': text,
      if (image != null) "image": await MultipartFile.fromFile(image.path),
      'tag': tag,
    });

    final response = await client.postFixed('$apiUrl/post/',
        data: postData, isFormData: true);

    if (response.statusCode! >= 400) {
      throw ServerFailure();
    } else if (response.statusCode! >= 200) {
      return response.data;
    }
  }

  @override
  Future<void> commentPost(int id, String text) async {
    final responseLike = await client
        .postFixed('$apiUrl/comment/', data: {'post': id, 'text': text});

    if (responseLike.statusCode! >= 400) {
      throw ServerFailure();
    } else if (responseLike.statusCode! >= 200) {
      return responseLike.data;
    }
  }

  @override
  Future<void> commentReplyPost(int id, String text, int parentId) async {
    final responseLike = await client.postFixed('/comment/',
        data: {'post': id, 'text': text, 'parent': parentId});

    if (responseLike.statusCode! >= 400) {
      throw ServerFailure();
    } else if (responseLike.statusCode! >= 200) {
      return responseLike.data;
    }
  }

  @override
  Future<PostModel> getDetailPost(int id) async {
    final response = await client.getFixed('/post/$id/');

    if (response.statusCode! >= 400) {
      throw ServerFailure();
    } else if (response.statusCode! >= 200) {
      return PostModel.fromJson(response.data);
    }

    return PostModel.fromJson(response.data);
  }
}
