import 'package:flutter/material.dart';

class TextWithIconWidget extends StatelessWidget {
  const TextWithIconWidget({Key? key, required this.text, required this.icon, required this.onPressed}) : super(key: key);
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
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
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
