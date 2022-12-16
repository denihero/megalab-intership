import 'package:flutter/material.dart';
import 'package:mega_intern/future/presentation/pages/login_screen.dart';

import 'future/presentation/pages/home_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}