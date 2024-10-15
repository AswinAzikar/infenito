import 'package:flutter/material.dart';
import 'package:infenito/themes/app_text_style.dart';

ThemeData get normalTheme => ThemeData(
      fontFamily: AppTextStyles.interFontFamily, 
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontFamily: AppTextStyles.interFontFamily),
        bodyMedium: TextStyle(fontFamily: AppTextStyles.interFontFamily),
      ),
      
    );
