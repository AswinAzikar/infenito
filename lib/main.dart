import 'package:flutter/material.dart';
import 'package:infenito/routes/routes.dart';
import 'package:infenito/themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: normalTheme,
      initialRoute: AppRoutes.signUp,
      routes: AppRoutes.routes,
      //  routes: ,
    );
  }
}
