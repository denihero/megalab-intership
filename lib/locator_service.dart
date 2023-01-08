import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mega_intern/future/auth/register/data/datasources/user_data_source.dart';
import 'package:mega_intern/future/auth/register/presentation/bloc/register_cubit.dart';

final sl = GetIt.instance;
init() {
  sl.registerFactory(() => RegisterCubit(sl()));
  
  sl.registerLazySingleton<UserDataSourceImpl>(() => UserDataSourceImpl(client: Dio()));
}