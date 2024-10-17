import 'package:flutter/material.dart';
import 'package:infenito/Utils/size_utils.dart';
import 'package:infenito/views/signup_screen.dart';

class AppTextStyles {
  static String poppinsFontFamily = "Poppins";
  static String interFontFamily = "Inter";

  static TextStyle poppins40014 = TextStyle(
      fontFamily: poppinsFontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 14.fSize);
  static TextStyle poppins50016 = TextStyle(
      fontFamily: poppinsFontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 16.fSize);
  static TextStyle poppins60018 = TextStyle(
      fontFamily: poppinsFontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 18.fSize);
  static TextStyle poppins70024 = TextStyle(
      fontFamily: poppinsFontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 24.fSize);

  static TextStyle inter40014 = TextStyle(
      fontFamily: interFontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 14.fSize);
  static TextStyle inter50016 = TextStyle(
      fontFamily: interFontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 16.fSize);
  static TextStyle inter60018 = TextStyle(
      fontFamily: interFontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 18.fSize);
  static TextStyle inter70024 = TextStyle(
      fontFamily: interFontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 24.fSize);
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
