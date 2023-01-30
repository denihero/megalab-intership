import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_intern/future/auth/login/presentation/bloc/login_cubit.dart';
import 'package:mega_intern/future/auth/login/presentation/page/login_page.dart';
import 'package:mega_intern/future/auth/register/presentation/bloc/register_cubit.dart';
import 'package:mega_intern/future/auth/register/presentation/pages/registration_page.dart';
import 'package:mega_intern/future/home/presentation/bloc/comment_post/comment_post_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_all_post/get_all_post_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_all_tag/get_all_tag_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_detail_post/get_detail_post_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_favourite/get_favourite_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_own_post/get_own_post_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/like_post/like_post_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/search_post/search_post_cubit.dart';
import 'package:mega_intern/future/home/presentation/pages/home_page.dart';

import 'future/home/presentation/bloc/get_user/get_user_cubit.dart';
import 'future/home/presentation/bloc/publish_post/publish_post_cubit.dart';
import 'locator_service.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (_) => sl<LoginCubit>()),
        BlocProvider<GetAllPostCubit>(create: (_) => sl<GetAllPostCubit>()),
        BlocProvider<LikePostCubit>(create: (_) => sl<LikePostCubit>()),
        BlocProvider<GetFavouriteCubit>(create: (_) => sl<GetFavouriteCubit>()),
        BlocProvider<GetUserCubit>(create: (_) => sl<GetUserCubit>()),
        BlocProvider<GetOwnPostCubit>(create: (_) => sl<GetOwnPostCubit>()),
        BlocProvider<GetAllTagCubit>(create: (_) => sl<GetAllTagCubit>()),
        BlocProvider<SearchPostCubit>(create: (_) => sl<SearchPostCubit>()),
        BlocProvider<GetDetailPostCubit>(
            create: (_) => sl<GetDetailPostCubit>()),
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        home: const RegistrationScreen(),
      ),
    );
  }
}
