import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_intern/future/auth/login/presentation/bloc/login_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_favourite/get_favourite_cubit.dart';

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
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border),
            title: const Text('Избранные новости'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const FavouriteScreen()));
              context.read<GetFavouriteCubit>().getFavourite();
            },
          ),
          const Spacer(),
          ListTile(
            title: const Text('Выйти'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {
              context.read<LoginCubit>().logoutCubit();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                ModalRoute.withName('/'),
              );
            },
          )
        ],
      ),
    );
  }
}
