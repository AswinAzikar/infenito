import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:infenito/Utils/size_utils.dart';
import 'package:infenito/constants/constants.dart';
import 'package:infenito/gen/assets.gen.dart';
import 'package:infenito/themes/app_text_style.dart';
import 'package:infenito/themes/themes.dart';
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlassmorphicContainer(
              borderRadius: 0,
              borderColor: Colors.transparent,
              borderThickness: 0,
              containerPadding: EdgeInsets.fromLTRB(SizeUtils.width * .04,
                  SizeUtils.width * .08, SizeUtils.width * .04, 0),
              //SizeUtils.width * .01),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        Gap(SizeUtils.width * 0.04.h),
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
                        Gap(SizeUtils.width * 0.07.h),
                        Row(
                          children: [
                            Expanded(
                                child: TextFormField(
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                hintText: "Search favourite Beverages",
                                hintStyle: context.poppins40014.copyWith(
                                    color: const Color(0xffBBBBBC),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300),
                                prefixIcon: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: SvgPicture.asset(
                                    Assets.svgs.search,
                                  ),
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: SvgPicture.asset(
                                      Assets.svgs.searchSetttings,
                                    ),
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors
                                          .white), // Color when not focused
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors
                                          .transparent), // Color when focused
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            )),
                          ],
                        ),
                        Gap(SizeUtils.width * 0.07.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                GlassmorphicContainer(
                  //borderThickness: 0,
                  borderRadius: 0,
                  borderColor: Colors.transparent,
                  backgroundColorOpacity: 0.4,
                  backgroundColor: const Color(0xff313131),
                  child: Column(
                    children: [
                      Gap(SizeUtils.width * 0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          gap,
                          Text(
                            "Most Popular Beverages",
                            style: context.inter60018.copyWith(
                                color: textColor, fontWeight: FontWeight.w400),
                          ),
                          gapLarge,
                        ],
                      ),
                      Gap(SizeUtils.width * 0.1)
                    ],
                  ),
                ),
                Gap(SizeUtils.width * 0.03.h),
              ],
            )
          ],
        ),
      ),
    );
  }
}
