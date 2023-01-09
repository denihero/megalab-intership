import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_intern/future/auth/login/presentation/bloc/login_cubit.dart';
import 'package:mega_intern/future/auth/login/presentation/page/login_page.dart';
import 'package:mega_intern/future/auth/register/presentation/bloc/register_cubit.dart';
import 'package:mega_intern/future/auth/register/presentation/pages/registration_page.dart';
import 'package:mega_intern/future/home/presentation/pages/home_page.dart';

import 'locator_service.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<RegisterCubit>()),
        BlocProvider(create: (_) => sl<LoginCubit>()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RegistrationScreen(),
      ),
    );
  }
}
