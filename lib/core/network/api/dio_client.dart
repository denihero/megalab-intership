import 'package:dio/dio.dart';
import 'package:mega_intern/core/storage/storage.dart';

class DioClient {
  final dio = Dio(
    BaseOptions(
        baseUrl: 'https://megalab.pythonanywhere.com',
        receiveTimeout: 8000,
        connectTimeout: 5000),
  );

  Future<Response<T>> getFixed<T>(String path) async {
    final options = Options(headers: {
      'Authorization': 'Token ${await SecureStorage.readData('mega')}'
    });
    return dio.get(path, options: options);
  }

  Future<Response<T>> postFixed<T>(String path, {data,
      bool? isFormData = false}) async {
    final options = Options(headers: {
      'Authorization': 'Token ${await SecureStorage.readData('mega')}',
      'Content-Type':
          isFormData == true ? 'multipart/form-data' : 'application/json',
    });
    return dio.post(path, options: options, data: data);
  }
}
