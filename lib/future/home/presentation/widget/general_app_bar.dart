import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_intern/core/common/image.dart';
import 'package:mega_intern/future/widgets/svg_icon_widget.dart';

import '../../../../theme/palette.dart';
import '../pages/home_page.dart';
import '../pages/profile_page.dart';


class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget  {
  const GeneralAppBar({Key? key, required this.drawerKey}) : super(key: key);

  final GlobalKey<ScaffoldState> drawerKey;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: SvgIconButtonWidget(
        padding: EdgeInsets.zero,
        icon: SvgPicture.asset(
          AssetsIcon.megaLab,
          color: Palette.PURPLE,
        ),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HomeScreen()));
        },
      ),
      actions: [
        SvgIconButtonWidget(
          icon: SvgPicture.asset(
            AssetsIcon.search,
            color: Palette.PURPLE,
          ),
          onPressed: () {},
        ),
        SvgIconButtonWidget(
          icon: SvgPicture.asset(
            AssetsIcon.profile,
            color: Palette.PURPLE,
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const ProfileScreen()));
          },
        ),
        SvgIconButtonWidget(
          icon: SvgPicture.asset(
            AssetsIcon.menu,
            color: Palette.PURPLE,
          ),
          onPressed: () {
            drawerKey.currentState!.openEndDrawer();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(400, 50);
}
