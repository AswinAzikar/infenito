import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infenito/themes/app_text_style.dart';

ThemeData get normalTheme => ThemeData(
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      )),
      fontFamily: AppTextStyles.interFontFamily,
      textTheme: TextTheme(
        bodyLarge: TextStyle(fontFamily: AppTextStyles.interFontFamily),
        bodyMedium: TextStyle(fontFamily: AppTextStyles.interFontFamily),
      ),
    );
