import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mega_intern/theme/palette.dart';

// ignore_for_file: non_constant_identifier_names
class Style {
  static TextStyle UBUNTU_42_400_WHITE = GoogleFonts.ubuntu(
      textStyle: const TextStyle(
    color: Palette.WHITE,
    fontSize: 42,
    fontWeight: FontWeight.w400,
  ));

  static TextStyle UBUNTU_30_500_BLACK = GoogleFonts.ubuntu(
      textStyle: const TextStyle(
    color: Palette.BLACK,
    fontSize: 30,
    fontWeight: FontWeight.w500,
  ));

  static TextStyle UBUNTU_24_500_BLACK = GoogleFonts.ubuntu(
      textStyle: const TextStyle(
    color: Palette.BLACK,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  ));

  static TextStyle UBUNTU_16_400_BLACK = GoogleFonts.ubuntu(
      textStyle: const TextStyle(
    color: Palette.BLACK,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ));

  static TextStyle UBUNTU_16_400_PURPLE = GoogleFonts.ubuntu(
      textStyle: const TextStyle(
    color: Palette.PURPLE,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ));

  static TextStyle UBUNTU_16_400_GREY = GoogleFonts.ubuntu(
    textStyle: const TextStyle(
      color: Palette.GREY,
      fontSize: 17,
      fontWeight: FontWeight.w400,
    ),
  );

  static TextStyle UBUNTU_15_500_BLACK = GoogleFonts.ubuntu(
      textStyle: const TextStyle(
    color: Palette.BLACK,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  ));

  static TextStyle UBUNTU_13_400_BLACK = GoogleFonts.ubuntu(
      textStyle: const TextStyle(
    color: Palette.BLACK,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  ));

  static TextStyle UBUNTU_16_500_WHITE = GoogleFonts.ubuntu(
      textStyle: const TextStyle(
    color: Palette.WHITE,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ));
}
