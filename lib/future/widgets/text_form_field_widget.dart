import 'package:flutter/material.dart';
import 'package:mega_intern/theme/palette.dart';
import 'package:mega_intern/theme/style.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.title,
    this.padding = const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    this.initialValue,
    this.enabled = false,
    this.suffixIcon,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
    this.height,
    this.borderRadius = 10,
    this.maxLines = 1,
    this.obscureText = false,
    this.controller,
    this.keys,
    this.onEditComplete,
    this.focusNode,
  }) : super(key: key);

  final String title;
  final GlobalKey? keys;
  final EdgeInsets padding;
  final EdgeInsets contentPadding;
  final String? initialValue;
  final bool enabled;
  final bool obscureText;
  final Widget? suffixIcon;
  final double? height;
  final double borderRadius;
  final int? maxLines;
  final TextEditingController? controller;
  final VoidCallback? onEditComplete;
  final FocusNode? focusNode;

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
              style: Style.UBUNTU_16_400_BLACK,
            ),
          ),
          SizedBox(
            height: height,
            child: TextFormField(
              key: keys,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: controller,
              keyboardType: TextInputType.multiline,
              maxLines: maxLines,
              focusNode: focusNode,
              obscureText: obscureText,
              textInputAction: TextInputAction.next,
              onEditingComplete: onEditComplete,
              //initialValue: controller != null ? controller?.text : (initialValue ?? ''),
              //readOnly: enabled,
              decoration: InputDecoration(
                  suffixIcon: suffixIcon,
                  contentPadding: contentPadding,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Palette.WHITE),
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: const BorderSide(color: Palette.PURPLE),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: const BorderSide(color: Palette.GREY),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: const BorderSide(color: Palette.PURPLE),
                  ),
                  enabled: enabled),
            ),
          ),
        ],
      ),
    );
  }
}
