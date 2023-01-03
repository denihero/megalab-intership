import 'package:flutter/material.dart';

class SvgIconButtonWidget extends StatelessWidget {
  const SvgIconButtonWidget(
      {Key? key,
      required this.icon,
      required this.onPressed,
      this.padding = const EdgeInsets.all(8.0)})
      : super(key: key);
  final Widget icon;
  final Function() onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: onPressed,
        child: Padding(
          padding: padding!,
          child: icon,
        ));
  }
}
