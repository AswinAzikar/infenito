import 'package:flutter/material.dart';

class AppTextStyles {
  static const String poppinsFontFamily = "Poppins";
  static const String interFontFamily = "Inter";

  static TextStyle poppins40014 = const TextStyle(
      fontFamily: poppinsFontFamily, fontWeight: FontWeight.w400, fontSize: 14);
  static TextStyle poppins50016 = const TextStyle(
      fontFamily: poppinsFontFamily, fontWeight: FontWeight.w500, fontSize: 16);
  static TextStyle poppins60018 = const TextStyle(
      fontFamily: poppinsFontFamily, fontWeight: FontWeight.w600, fontSize: 18);
  static TextStyle poppins70024 = const TextStyle(
      fontFamily: poppinsFontFamily, fontWeight: FontWeight.w700, fontSize: 24);

  static TextStyle inter40014 = const TextStyle(
      fontFamily: interFontFamily, fontWeight: FontWeight.w400, fontSize: 14);
  static TextStyle inter50016 = const TextStyle(
      fontFamily: interFontFamily, fontWeight: FontWeight.w500, fontSize: 16);
  static TextStyle inter60018 = const TextStyle(
      fontFamily: interFontFamily, fontWeight: FontWeight.w600, fontSize: 18);
  static TextStyle inter70024 = const TextStyle(
      fontFamily: interFontFamily, fontWeight: FontWeight.w700, fontSize: 24);
}

extension TextStyleExtensions on BuildContext {
  TextStyle get poppins40014 => AppTextStyles.poppins40014;
  TextStyle get poppins50016 => AppTextStyles.poppins50016;
  TextStyle get poppins60018 => AppTextStyles.poppins60018;
  TextStyle get poppins70024 => AppTextStyles.poppins70024;

  TextStyle get inter40014 => AppTextStyles.inter40014;
  TextStyle get inter50016 => AppTextStyles.inter50016;
  TextStyle get inter60018 => AppTextStyles.inter60018;
  TextStyle get inter70024 => AppTextStyles.inter70024;
}

