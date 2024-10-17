import 'package:flutter/material.dart';
import 'package:infenito/Utils/size_utils.dart';
import 'package:infenito/views/navigation_screen.dart';
import '../views/detail_screen/detail_screen.dart';
import '../views/signup_screen.dart';

class AppRoutes {
  static const String signUp = '/';
  static const String navigation ='Navigator';
  static const String home = '/home';
  static const String detailScreen = '/detailScreen';

  static Map<String, WidgetBuilder> get routes {
    return {
      detailScreen: (context) => const DetailScreen(),
      signUp: (context) => const SignUpScreen(),
      navigation: (context) => const NavigationScreen(),
 //     home: (context) => const HomeScreen(),
      
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
