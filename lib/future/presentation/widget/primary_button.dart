import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.child, required this.onPressed, this.padding = const EdgeInsets.symmetric(horizontal: 70)})
      : super(key: key);

  final Widget child;
  final Function() onPressed;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color.fromRGBO(126, 91, 194, 1),
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))),
          onPressed: onPressed,
          child: child),
    );
  }
}
