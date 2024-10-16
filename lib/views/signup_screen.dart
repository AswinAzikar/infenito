import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:infenito/Utils/size_utils.dart';
import 'package:infenito/constants/constants.dart';
import 'package:infenito/gen/assets.gen.dart';
import 'package:infenito/routes/routes.dart';
import 'package:infenito/themes/app_text_style.dart';
import 'package:infenito/widgets/buttons.dart';
import 'package:infenito/widgets/glass_morphic_container.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    Gap gap1 = Gap(SizeUtils.width * .1);
    Gap gap2 = Gap(SizeUtils.width * .2);
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
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
          SizedBox(
            child: SvgPicture.asset(
              height: SizeUtils.height,
              Assets.svgs.grainy,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: SizeUtils.height * 0.05,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                  paddingXL, padding, paddingXL, paddingLarge),
              child: GlassmorphicContainer(
                borderRadius: 25,
                borderThickness: 2,
                borderColor: Colors.grey.withOpacity(0.3),
                child: Padding(
                  padding: const EdgeInsets.all(padding),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      gap1,
                      Image.asset(
                        Assets.pngs.asset111.path,
                        width: 89.fSize,
                        height: 70.fSize,
                      ),
                      gap,
                      SvgPicture.asset(Assets.svgs.welcomeTag),
                      gapLarge,
                      gapLarge,
                      Text(
                        "\"Latte but never late\"",
                        style: context.poppins40014.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          shadows: [
                            Shadow(
                              offset: Offset.fromDirection(
                                  BorderSide.strokeAlignOutside),
                              color: const Color.fromARGB(255, 255, 255, 255)
                                  .withOpacity(1),
                              blurRadius: 40,
                            ),
                          ],
                        ),
                      ),
                      gap,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: paddingLarge, vertical: padding),
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (_) {
                                return null;
                              },
                              style: context.poppins40014
                                  .copyWith(color: Colors.white),
                              cursorColor: Colors.white,
                              cursorErrorColor: Colors.red,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                labelText: 'User Name',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.5),
                                      width: 1),
                                ),
                                border: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                              ),
                            ),
                            TextFormField(
                              validator: (_) {
                                return null;
                              },
                              style: context.poppins40014
                                  .copyWith(color: Colors.white),
                              cursorColor: Colors.white,
                              cursorErrorColor: Colors.red,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                labelText: 'Password',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.5),
                                      width: 1),
                                ),
                                border: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                              ),
                            ),
                            gap2,
                            LoadingButton(
                                buttonLoading: false,
                                text: "Login",
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, AppRoutes.navigation);
                                }),
                            gap1,
                            LoadingButton(
                                buttonType: ButtonType.outlined,
                                buttonLoading: false,
                                text: "Signup",
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, AppRoutes.navigation);
                                }),
                            gap1,
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Privacy Policy",
                                  style: context.inter40014
                                      .copyWith(color: Colors.white),
                                )),
                            gap1,
                          ],
                        ),
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
