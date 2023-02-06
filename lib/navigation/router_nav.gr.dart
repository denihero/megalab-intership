// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router_nav.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    LoginScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    RegistrationScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const RegistrationScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    FavouriteScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const FavouriteScreen(),
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    DetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<DetailScreenRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: DetailScreen(
          key: args.key,
          post: args.post,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          LoginScreenRoute.name,
          path: '/login-screen',
        ),
        RouteConfig(
          RegistrationScreenRoute.name,
          path: '/registration-screen',
        ),
        RouteConfig(
          HomeScreenRoute.name,
          path: '/',
          guards: [authGuard],
        ),
        RouteConfig(
          FavouriteScreenRoute.name,
          path: '/favourite-screen',
        ),
        RouteConfig(
          ProfileScreenRoute.name,
          path: '/profile-screen',
        ),
        RouteConfig(
          DetailScreenRoute.name,
          path: '/detail-screen',
        ),
      ];
}

/// generated route for
/// [LoginScreen]
class LoginScreenRoute extends PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/login-screen',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [RegistrationScreen]
class RegistrationScreenRoute extends PageRouteInfo<void> {
  const RegistrationScreenRoute()
      : super(
          RegistrationScreenRoute.name,
          path: '/registration-screen',
        );

  static const String name = 'RegistrationScreenRoute';
}

/// generated route for
/// [HomeScreen]
class HomeScreenRoute extends PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '/',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [FavouriteScreen]
class FavouriteScreenRoute extends PageRouteInfo<void> {
  const FavouriteScreenRoute()
      : super(
          FavouriteScreenRoute.name,
          path: '/favourite-screen',
        );

  static const String name = 'FavouriteScreenRoute';
}

/// generated route for
/// [ProfileScreen]
class ProfileScreenRoute extends PageRouteInfo<void> {
  const ProfileScreenRoute()
      : super(
          ProfileScreenRoute.name,
          path: '/profile-screen',
        );

  static const String name = 'ProfileScreenRoute';
}

/// generated route for
/// [DetailScreen]
class DetailScreenRoute extends PageRouteInfo<DetailScreenRouteArgs> {
  DetailScreenRoute({
    Key? key,
    required PostModel post,
  }) : super(
          DetailScreenRoute.name,
          path: '/detail-screen',
          args: DetailScreenRouteArgs(
            key: key,
            post: post,
          ),
        );

  static const String name = 'DetailScreenRoute';
}

class DetailScreenRouteArgs {
  const DetailScreenRouteArgs({
    this.key,
    required this.post,
  });

  final Key? key;

  final PostModel post;

  @override
  String toString() {
    return 'DetailScreenRouteArgs{key: $key, post: $post}';
  }
}
