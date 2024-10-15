import 'package:flutter/material.dart';
import 'package:infenito/Utils/size_utils.dart';
import '../views/signup_screen.dart';

class AppRoutes {
  static const String signUp = '/';
  static const String home = '/home';

  static Map<String, WidgetBuilder> get routes {
    return {
      signUp: (context) => const SignUpScreen(),
      
    };
  }

  static Widget getResponsiveSignUp(
      BuildContext context, Orientation orientation) {
    
    return  Sizer(
      builder: (context, orientation, deviceType) {
        return const SignUpScreen();
      },
    );
  }
}
