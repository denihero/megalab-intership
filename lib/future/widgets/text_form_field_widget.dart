import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.title,
    this.padding = const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    this.initialValue = '',
    this.enabled = false,
    this.suffixIcon,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
    this.height,
    this.borderRadius = 10, this.maxLines = 1, this.obscureText = false,
  }) : super(key: key);

  final String title;
  final EdgeInsets padding;
  final EdgeInsets contentPadding;
  final String initialValue;
  final bool enabled;
  final bool obscureText;
  final Widget? suffixIcon;
  final double? height;
  final double borderRadius;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8, bottom: 8),
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: height,
            child: TextFormField(
              initialValue: initialValue,
              keyboardType: TextInputType.multiline,
              maxLines: maxLines,
              obscureText: obscureText,
              //readOnly: enabled,
              decoration: InputDecoration(
                  suffixIcon: suffixIcon,
                  contentPadding: contentPadding,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(228, 223, 220, 1),
                    ),
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(126, 91, 194, 1),
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(126, 91, 194, 1),
                    ),
                  ),
                  enabled: enabled),
            ),
          ),
        ],
      ),
    );
  }
}
