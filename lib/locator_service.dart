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

final sl = GetIt.instance;
init() {
  //BloC and Cubit
  sl.registerFactory(() => RegisterCubit(sl()));
  sl.registerFactory(() => LoginCubit(sl()));


  //UseCases
  sl.registerLazySingleton(() => Register(sl()));
  sl.registerLazySingleton(() => Login(sl()));

  //Service
  sl.registerLazySingleton<RegisterDataSource>(() => RegisterDataSourceImpl(client: Dio()));
  sl.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl(client: Dio()));


  //Repositories
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl()));
  sl.registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl(sl()));


}