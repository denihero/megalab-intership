import 'package:dio/dio.dart';
import 'package:mega_intern/core/common/string.dart';
import 'package:mega_intern/core/error/failure.dart';
import 'package:mega_intern/future/home/data/model/home_model.dart';

abstract class PostDataSources {
  Future<List<PostModel>> getAllPosts(String token);
  Future<List<PostModel>> getFavourite(String token);
  Future<void> likePost(String token, int id);

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
  Future<List<PostModel>> getAllPosts(String token) async {
    final List<PostModel> ls = [];
    final response = await client.get(
        'https://megalab.pythonanywhere.com/post/',
        options: Options(headers: {'Authorization': 'Token $token'}));

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
  Future<void> likePost(String token, int id) async {
    final responseLike = await client.post('$apiUrl/like/',
        options: Options(headers: {'Authorization': 'Token $token'}),
        data: {'post': id});

      if(responseLike.statusCode! >= 400){
        throw ServerFailure();
      }else if(responseLike.statusCode! >= 200){
        return responseLike.data;
      }
  }

  @override
  Future<List<PostModel>> getFavourite(String token) async{
    final List<PostModel> ls = [];
    final response = await client.get(
        'https://megalab.pythonanywhere.com/like/',
        options: Options(headers: {'Authorization': 'Token $token'}));

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
}