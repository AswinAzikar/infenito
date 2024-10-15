import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infenito/Utils/size_utils.dart';
import 'package:infenito/constants/constants.dart';
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
          Positioned(
            top: SizeUtils.height * 0.05,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                  paddingXL, paddingLarge, paddingXL, paddingLarge),
              child: GlassmorphicContainer(
                borderRadius: 25,
                // padding: const EdgeInsets.symmetric(horizontal: padding),
                borderThickness: 2,
                borderColor: Colors.grey.withOpacity(0.3),
                child: Container(
                  //  width: double.infinity,
                  padding: const EdgeInsets.all(padding),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                Assets.pngs.asset111.path,
                                width: 89.fSize,
                                height: 70.fSize,
                              ),
                              SvgPicture.asset(Assets.svgs.welcomeTag),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
