import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mega_intern/future/auth/login/data/datasources/login_data_sources.dart';
import 'package:mega_intern/future/auth/login/data/repositories/login_repository_impl.dart';
import 'package:mega_intern/future/auth/login/domain/repositories/login_reposity.dart';
import 'package:mega_intern/future/auth/login/domain/usecases/login.dart';
import 'package:mega_intern/future/auth/login/presentation/bloc/login_cubit.dart';
import 'package:mega_intern/future/auth/register/data/datasources/user_data_source.dart';
import 'package:mega_intern/future/auth/register/data/repositories/register_repository_impl.dart';
import 'package:mega_intern/future/auth/register/domain/repositories/register_repository.dart';
import 'package:mega_intern/future/auth/register/domain/usecases/register.dart';
import 'package:mega_intern/future/auth/register/presentation/bloc/register_cubit.dart';
import 'package:mega_intern/future/home/data/repositories/post_repositories_impl.dart';
import 'package:mega_intern/future/home/domain/repositories/post_repositories.dart';
import 'package:mega_intern/future/home/domain/usecases/get_post.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_all_post/get_all_post_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_all_tag/get_all_tag_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_favourite/get_favourite_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_own_post/get_own_post_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_user/get_user_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/like_post/like_post_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/publish_post/publish_post_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/search_post/search_post_cubit.dart';

import 'future/home/data/datasources/post_data_sources.dart';

final sl = GetIt.instance;
init() {
  final dio = Dio();
  //BloC and Cubit
  sl.registerFactory(() => RegisterCubit(sl()));
  sl.registerFactory(() => LoginCubit(sl(),));
  sl.registerFactory(() => GetAllPostCubit(sl()));
  sl.registerFactory(() => LikePostCubit(sl()));
  sl.registerFactory(() => GetFavouriteCubit(sl()));
  sl.registerFactory(() => GetUserCubit(sl()));
  sl.registerFactory(() => GetOwnPostCubit(sl()));
  sl.registerFactory(() => GetAllTagCubit(sl()));
  sl.registerFactory(() => SearchPostCubit(sl()));
  sl.registerFactory(() => PublishPostCubit(sl()));

  //UseCases
  sl.registerLazySingleton(() => Register(sl()));
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => Post(sl()));

  //Service
  sl.registerLazySingleton<RegisterDataSource>(
      () => RegisterDataSourceImpl(client: dio));
  sl.registerLazySingleton<LoginDataSource>(
      () => LoginDataSourceImpl(client: dio));
  sl.registerLazySingleton<PostDataSources>(
      () => PostDataSourcesImpl(client: dio));

  //Repositories
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl()));
  sl.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(sl()));
  sl.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(sl()));
}
