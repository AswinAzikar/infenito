import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infenito/Utils/size_utils.dart';
import 'package:infenito/constants/constants.dart';
import 'package:infenito/gen/assets.gen.dart';
import 'package:infenito/widgets/circular_image_container.dart';
import 'package:infenito/widgets/glass_morphic_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          GlassmorphicContainer(
            borderColor: Colors.transparent,
            borderThickness: 0,
            containerPadding: EdgeInsets.fromLTRB(
                SizeUtils.width * .04,
                SizeUtils.width * .08,
                SizeUtils.width * .04,
                SizeUtils.width * .01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                Assets.pngs.waveHand.path,
                                width: 27.h,
                                height: 27.h,
                              ),
                              gap,
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "20/12/22",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xffB6B6B6)),
                                  ),
                                  Text(
                                    "Joshua Scalen",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffB6B6B6)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                  child: Container(
                                padding: const EdgeInsets.all(padding + 2),
                                height: 40.h,
                                width: 40.h,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xffF9F9F9),
                                ),
                                child: SvgPicture.asset(
                                  width: 8,
                                  height: 5,
                                  Assets.svgs.deleteIcon,
                                  fit: BoxFit.contain,
                                ),
                              )),
                              gap,
                              CircularImageContainer(
                                imageUrl: Assets.jpegs.user.path,
                                radius: 23.h,
                                borderColor: const Color(0xff71AB7A),
                                borderWidth: 1,
                              )
                            ],
                          )
                        ],
                      ),
                      gap,
                      Row(
                        children: [
                          SizedBox(
                              height: SizeUtils.width * .07,
                              width: SizeUtils.width,
                              child: TextFormField()),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
