import 'package:flutter/material.dart';
import 'package:mega_intern/future/presentation/pages/home_page.dart';
import 'package:mega_intern/future/presentation/pages/profile_page.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}
