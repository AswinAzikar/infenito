import 'package:flutter/material.dart';
import 'package:infenito/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.signUp,
      routes: AppRoutes.routes,
      //  routes: ,
    );
  }
}
