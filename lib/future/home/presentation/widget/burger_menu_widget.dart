import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_intern/future/auth/login/presentation/bloc/login_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_favourite/get_favourite_cubit.dart';
import 'package:mega_intern/navigation/router_nav.dart';

import '../../../auth/login/presentation/page/login_page.dart';
import '../pages/favourite_page.dart';
import '../pages/profile_page.dart';

class BurgerMenuWidget extends StatelessWidget {
  const BurgerMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          ListTile(
            title: const Text('Мой профиль'),
            leading: const Icon(Icons.person_outline),
            onTap: () {
              context.router.pushNamed('/profile-screen');
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border),
            title: const Text('Избранные новости'),
            onTap: () {
              context.router.pushNamed('/favourite-screen');
              context.read<GetFavouriteCubit>().getFavourite();
            },
          ),
          const Spacer(),
          ListTile(
            title: const Text('Выйти'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {
              context.read<LoginCubit>().logoutCubit();
              context.router.replaceAll([const RegistrationScreenRoute()]);
            },
          )
        ],
      ),
    );
  }
}
