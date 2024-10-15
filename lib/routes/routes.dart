// lib/routes.dart

import 'package:flutter/material.dart';
import '../views/signup_screen.dart';

class AppRoutes {
  static const String signUp = '/';
  static const String home = '/home';

  static Map<String, WidgetBuilder> get routes {
    return {



      
      signUp: (context) => const SignUpScreen(),
      //   home: (context) => HomePage(),
      // second: (context) => SecondPage(),
    };
  }
}
