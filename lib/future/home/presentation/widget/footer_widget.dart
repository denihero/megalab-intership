import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_intern/future/home/presentation/pages/favourite_page.dart';
import 'package:mega_intern/future/home/presentation/pages/profile_page.dart';
import 'package:mega_intern/theme/palette.dart';
import 'package:mega_intern/theme/style.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 150,
      color: SOFT_BLACK,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: SvgPicture.asset(
              'assets/icons/megalab_icon.svg',
              color: WHITE,
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
                  foregroundColor: MaterialStateProperty.all(WHITE),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const ProfileScreen()));
                },
                child: Text(
                  'Мой профиль',
                  style: UBUNTU_16_400_BLACK.copyWith(color: WHITE),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(WHITE),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const FavouriteScreen()));
                },
                child: Text(
                  'Избранные новости',
                  style: UBUNTU_16_400_BLACK.copyWith(color: WHITE),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
