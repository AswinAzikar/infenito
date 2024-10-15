import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infenito/gen/assets.gen.dart';
import 'package:infenito/widgets/glass_morphic_container.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: screenHeight,
            child: Image.asset(
              Assets.pngs.signupBg.path,
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(
            height: screenHeight,
            child: SvgPicture.asset(
              Assets.svgs.linearCoffeeGradient,
              fit: BoxFit.cover,
            ),
          ),
          GlassmorphicContainer(
            borderThickness: 2,
            borderColor: Colors.grey.withOpacity(0.3),
          )
        ],
      ),
    );
  }
}
