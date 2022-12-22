import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widget/svg_icon_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: SvgPicture.asset(
          'assets/icons/megalab_icon.svg',
          color: Color.fromRGBO(128, 81, 194, 1),
        ),
        actions: [
          SvgIconButtonWidget(
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              color: Color.fromRGBO(128, 81, 194, 1),
            ),
            onPressed: () {},
          ),
          SvgIconButtonWidget(
            icon: SvgPicture.asset(
              'assets/icons/profile.svg',
              color: Color.fromRGBO(128, 81, 194, 1),
            ),
            onPressed: () {},
          ),
          SvgIconButtonWidget(
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
              color: Color.fromRGBO(128, 81, 194, 1),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(),
    );
  }
}
