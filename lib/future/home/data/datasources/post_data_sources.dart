import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mega_intern/core/common/string.dart';
import 'package:mega_intern/core/error/failure.dart';
import 'package:mega_intern/core/storage/storage.dart';
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
  final Dio client;

  PostDataSourcesImpl({required this.client});

  // @override
  // Future<void> deletePost(int id) async {
  //   print('121');
  // }

  @override
  Future<List<PostModel>> getAllPosts() async {
    final List<PostModel> ls = [];
    final response = await client.get('$apiUrl/post/',
        options: Options(headers: {
          'Authorization': 'Token ${await SecureStorage.readData('mega')}'
        }));

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
    final responseLike = await client.post('$apiUrl/like/',
        options: Options(headers: {
          'Authorization': 'Token ${await SecureStorage.readData('mega')}'
        }),
        data: {'post': id});

    if (responseLike.statusCode! >= 400) {
      throw ServerFailure();
    } else if (responseLike.statusCode! >= 200) {
      return responseLike.data;
    }
  }

  @override
  Future<List<PostModel>> getFavourite() async {
    final List<PostModel> ls = [];
    final response = await client.get('$apiUrl/like/',
        options: Options(headers: {
          'Authorization': 'Token ${await SecureStorage.readData('mega')}'
        }));

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
    final response = await client.get('$apiUrl/user/',
        options: Options(headers: {
          'Authorization': 'Token ${await SecureStorage.readData('mega')}'
        }));

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
    final response = await client.get('$apiUrl/post/?author=$author',
        options: Options(headers: {
          'Authorization': 'Token ${await SecureStorage.readData('mega')}'
        }));

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
    final response = await client.get('$apiUrl/tag/',
        options: Options(headers: {
          'Authorization': 'Token ${await SecureStorage.readData('mega')}'
        }));

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
    final response = await client.get('$apiUrl/post/?search=$query',
        options: Options(headers: {
          'Authorization': 'Token ${await SecureStorage.readData('mega')}'
        }));

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

    final response = await client.post('$apiUrl/post/',
        options: Options(headers: {
          'Authorization': 'Token ${await SecureStorage.readData('mega')}',
          'Content-Type': 'multipart/form-data',
        }),
        data: postData);

    if (response.statusCode! >= 400) {
      throw ServerFailure();
    } else if (response.statusCode! >= 200) {
      return response.data;
    }
  }

  @override
  Future<void> commentPost(int id, String text) async {
    final responseLike = await client.post('$apiUrl/comment/',
        options: Options(headers: {
          'Authorization': 'Token ${await SecureStorage.readData('mega')}',
          'Content-Type': 'application/json',
        }),
        data: {'post': id, 'text': text});

    if (responseLike.statusCode! >= 400) {
      throw ServerFailure();
    } else if (responseLike.statusCode! >= 200) {
      return responseLike.data;
    }
  }

  @override
  Future<void> commentReplyPost(int id, String text, int parentId) async {
    final responseLike = await client.post('$apiUrl/comment/',
        options: Options(headers: {
          'Authorization': 'Token ${await SecureStorage.readData('mega')}',
        }),
        data: {'post': id, 'text': text, 'parent': parentId});

    if (responseLike.statusCode! >= 400) {
      throw ServerFailure();
    } else if (responseLike.statusCode! >= 200) {
      return responseLike.data;
    }
  }

  @override
  Future<PostModel> getDetailPost(int id) async {
    final response = await client.get('$apiUrl/post/$id/',
        options: Options(headers: {
          'Authorization': 'Token ${await SecureStorage.readData('mega')}'
        }));

    if (response.statusCode! >= 400) {
      throw ServerFailure();
    } else if (response.statusCode! >= 200) {
      return PostModel.fromJson(response.data);
    }

    return PostModel.fromJson(response.data);
  }
}
