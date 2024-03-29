import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_intern/core/common/image.dart';
import 'package:mega_intern/future/home/presentation/pages/favourite_page.dart';
import 'package:mega_intern/future/home/presentation/pages/profile_page.dart';
import 'package:mega_intern/theme/palette.dart';
import 'package:mega_intern/theme/style.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 150,
      color: Palette.SOFT_BLACK,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: SvgPicture.asset(
              AssetsIcon.megaLab,
              color: Palette.WHITE,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Palette.WHITE),
                ),
                onPressed: () {
                  context.router.pushNamed('/profile-screen');
                },
                child: Text(
                  'Мой профиль',
                  style: Style.UBUNTU_16_400_BLACK.copyWith(color: Palette.WHITE),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Palette.WHITE),
                ),
                onPressed: () {
                  context.router.pushNamed('/favourite-screen');
                },
                child: Text(
                  'Избранные новости',
                  style: Style.UBUNTU_16_400_BLACK.copyWith(color: Palette.WHITE),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
