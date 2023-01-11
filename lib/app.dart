import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_intern/future/auth/login/presentation/bloc/login_cubit.dart';
import 'package:mega_intern/future/auth/login/presentation/page/login_page.dart';
import 'package:mega_intern/future/auth/register/presentation/bloc/register_cubit.dart';
import 'package:mega_intern/future/auth/register/presentation/pages/registration_page.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_all_post/get_all_post_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_favourite/get_favourite_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/like_post/like_post_cubit.dart';
import 'package:mega_intern/future/home/presentation/pages/home_page.dart';

import 'locator_service.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterCubit>(create: (_) => sl<RegisterCubit>()),
        BlocProvider<LoginCubit>(create: (_) => sl<LoginCubit>()),
        BlocProvider<GetAllPostCubit>(create: (_) => sl<GetAllPostCubit>()),
        BlocProvider<LikePostCubit>(create: (_) => sl<LikePostCubit>()),
        BlocProvider<GetFavouriteCubit>(create: (_) => sl<GetFavouriteCubit>()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RegistrationScreen(),
      ),
    );
  }
}
