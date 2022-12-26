import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_intern/future/presentation/pages/favourite_page.dart';
import 'package:mega_intern/future/presentation/pages/profile_page.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      color: const Color.fromRGBO(12, 12, 12, 1),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: SvgPicture.asset(
              'assets/icons/megalab_icon.svg',
              color: Colors.white,
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
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
                },
                child: const Text(
                  'Мой профиль',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const FavouriteScreen()));
                },
                child: const Text('Избранные новости',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
