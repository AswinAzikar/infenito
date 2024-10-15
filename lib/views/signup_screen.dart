import 'package:flutter/material.dart';
import 'package:infenito/gen/assets.gen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          Assets.pngs.signupBg.path,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
