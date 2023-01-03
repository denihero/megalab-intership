import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShareWidget extends StatelessWidget {
  const ShareWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 13, bottom: 16),
                child: Text(
                  'Поделиться',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
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
                backgroundColor: const Color.fromRGBO(251, 249, 251, 1),
                radius: 30,
                child: SvgPicture.asset(
                  'assets/icons/telegram.svg',
                  width: 20,
                  height: 20,
                ),
              ),
              CircleAvatar(
                backgroundColor: const Color.fromRGBO(251, 249, 251, 1),
                radius: 30,
                child: SvgPicture.asset(
                  'assets/icons/twitter.svg',
                  width: 20,
                  height: 20,
                ),
              ),
              CircleAvatar(
                backgroundColor: const Color.fromRGBO(251, 249, 251, 1),
                radius: 30,
                child: SvgPicture.asset(
                  'assets/icons/facebook.svg',
                  width: 25,
                  height: 25,
                ),
              ),
              CircleAvatar(
                backgroundColor: const Color.fromRGBO(251, 249, 251, 1),
                radius: 30,
                child: SvgPicture.asset(
                  'assets/icons/whats.svg',
                  width: 25,
                  height: 25,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 13, top: 17),
            child: Text(
              'Короткая ссылка',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
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
                          await Clipboard.setData(ClipboardData(text: "link"));
                        },
                        icon: const Icon(
                          Icons.copy,
                          color: Colors.black,
                        )),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    fillColor: const Color.fromRGBO(251, 249, 251, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
