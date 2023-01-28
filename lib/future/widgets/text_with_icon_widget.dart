import 'package:flutter/material.dart';
import 'package:mega_intern/theme/style.dart';

class TextWithIconWidget extends StatelessWidget {
  const TextWithIconWidget(
      {Key? key,
      required this.text,
      required this.icon,
      required this.onPressed})
      : super(key: key);
  final String text;
  final Widget icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Text(
            text,
            style: Style.UBUNTU_13_400_BLACK.copyWith(fontSize: 14),
          ),
          const SizedBox(
            width: 5,
          ),
          icon
        ],
      ),
    );
  }
}
