import 'package:flutter/cupertino.dart';
import 'package:mega_intern/future/auth/login/presentation/page/login_page.dart';
import 'package:mega_intern/future/home/presentation/pages/detail_page.dart';
import 'package:mega_intern/future/home/presentation/pages/favourite_page.dart';
import 'package:mega_intern/future/home/presentation/pages/home_page.dart';
import 'package:mega_intern/future/home/presentation/pages/profile_page.dart';
import 'package:auto_route/auto_route.dart';
import '../future/auth/register/presentation/pages/registration_page.dart';
import '../future/home/data/model/home_model.dart';


part 'router_nav.gr.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: LoginScreen),
    AutoRoute(page: RegistrationScreen, initial: true),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: FavouriteScreen),
    AutoRoute(page: ProfileScreen),
    AutoRoute(page: DetailScreen),
  ],
)
class AppRouter extends _$AppRouter {}
