import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_intern/theme/palette.dart';
import 'package:mega_intern/theme/style.dart';

class ShareWidget extends StatelessWidget {
  const ShareWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: WHITE,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 13, bottom: 16),
                child: Text(
                  'Поделиться',
                  style: UBUNTU_16_400_BLACK.copyWith(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 13, bottom: 16),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close)),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: WHITE,
                radius: 30,
                child: SvgPicture.asset(
                  'assets/icons/telegram.svg',
                  width: 20,
                  height: 20,
                ),
              ),
              CircleAvatar(
                backgroundColor: BONE,
                radius: 30,
                child: SvgPicture.asset(
                  'assets/icons/twitter.svg',
                  width: 20,
                  height: 20,
                ),
              ),
              CircleAvatar(
                backgroundColor: BONE,
                radius: 30,
                child: SvgPicture.asset(
                  'assets/icons/facebook.svg',
                  width: 25,
                  height: 25,
                ),
              ),
              CircleAvatar(
                backgroundColor: BONE,
                radius: 30,
                child: SvgPicture.asset(
                  'assets/icons/whats.svg',
                  width: 25,
                  height: 25,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13, top: 17),
            child: Text(
              'Короткая ссылка',
              style: UBUNTU_16_400_BLACK.copyWith(
                  fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: SizedBox(
              height: 50,
              width: 380,
              child: TextFormField(
                initialValue: 'Какой - то текс ссылки',
                readOnly: true,
                decoration: InputDecoration(
                    filled: true,
                    suffixIcon: IconButton(
                        onPressed: () async {
                          await Clipboard.setData(
                              const ClipboardData(text: "link"));
                        },
                        icon: const Icon(
                          Icons.copy,
                          color: Colors.black,
                        )),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    fillColor: BONE,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: WHITE,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: WHITE))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
