import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:infenito/Utils/size_utils.dart';
import 'package:infenito/constants/constants.dart';
import 'package:infenito/gen/assets.gen.dart';
import 'package:infenito/models/beverage.dart';
import 'package:infenito/themes/app_text_style.dart';
import 'package:infenito/views/detail_screen/detail_screen.dart';
import 'package:infenito/views/home_screen/widgets/scroll_card_tile.dart';
import 'package:infenito/widgets/circular_image_container.dart';
import 'package:infenito/widgets/glass_morphic_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Beverage>> loadBeverageData() async {
    String jsonString = await rootBundle.loadString('assets/data/data.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);

    return jsonResponse.map((data) {
      final Map<String, dynamic> userMap = Map<String, dynamic>.from(data);
      return Beverage.fromJson(userMap);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: GlassmorphicContainer(
        borderRadius: 0,
        borderColor: Colors.transparent,
        backgroundColorOpacity: 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlassmorphicContainer(
              borderRadius: 0,
              borderColor: Colors.transparent,
              borderThickness: 0,
              containerPadding: EdgeInsets.fromLTRB(
                SizeUtils.width * .04,
                SizeUtils.width * .08,
                SizeUtils.width * .04,
                0,
              ),
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
                                        color: Color(0xffB6B6B6),
                                      ),
                                    ),
                                    Text(
                                      "Joshua Scalen",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffB6B6B6),
                                      ),
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
                                  ),
                                ),
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
                                    child: SvgPicture.asset(Assets.svgs.search),
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: SvgPicture.asset(
                                          Assets.svgs.searchSetttings),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
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
                Container(
                  color: const Color(0xff444143),
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
                      Gap(SizeUtils.width * 0.05),
                      SizedBox(
                        height: SizeUtils.width / 1.6,
                        child: FutureBuilder<List<Beverage>>(
                          future: loadBeverageData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error:${snapshot.error}'));
                            } else if (snapshot.hasData) {
                              final beverages = snapshot.data!;

                              return ListView.builder(
                                itemExtent: 240,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final beverage = beverages[index];

                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        padding, 0, 0, 0),
                                    child: Stack(children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: SizedBox(
                                          width: SizeUtils.width / 2,
                                          child: GlassmorphicContainer(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 204, 199, 199),
                                            backgroundColorOpacity: 0.3,
                                            borderRadius: 7,
                                            borderThickness: 0,
                                            borderColor: Colors.grey.shade700,
                                            containerPadding:
                                                EdgeInsets.all(paddingLarge.h),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Center(
                                                      child: Image.asset(
                                                        index % 2 != 0
                                                            ? Assets.pngs
                                                                .capuccino.path
                                                            : Assets.pngs
                                                                .coffee211.path,
                                                        height: 150,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          SizeUtils.width / 3,
                                                      child: Text(
                                                        beverage.name,
                                                        style: context
                                                            .inter60018
                                                            .copyWith(
                                                                color: const Color(
                                                                    0xffCDCDCD)),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const Gap(paddingSmall),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              width: SizeUtils
                                                                      .width /
                                                                  3,
                                                              child: Text(
                                                                beverage.type,
                                                                style: context
                                                                    .inter40014
                                                                    .copyWith(
                                                                        fontSize:
                                                                            12),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const Gap(paddingSmall),
                                                        Row(
                                                          children: [
                                                            Text(beverage.rating
                                                                .toString()),
                                                            const Gap(
                                                                paddingSmall),
                                                            SvgPicture.asset(
                                                                Assets
                                                                    .svgs.star),
                                                            const Gap(
                                                                paddingSmall),
                                                            Text(
                                                                "(${beverage.numberOfRatings.toString()})")
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            Navigator.pushNamed(
                                                                context,
                                                                '/detailScreen');
                                                          },
                                                          child: SvgPicture
                                                              .asset(Assets.svgs
                                                                  .addButtonGreen),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: -3.h,
                                        left: -3.h,
                                        child:
                                            SvgPicture.asset(Assets.svgs.curve),
                                      )
                                    ]),
                                  );
                                },
                                itemCount: beverages.length,
                              );
                            }
                            return const Text("Error 404");
                          },
                        ),
                      ),
                      Gap(SizeUtils.width * 0.1),
                    ],
                  ),
                ),
                Gap(SizeUtils.width * 0.02.h),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Get it instantly",
                          style: context.inter50016
                              .copyWith(fontSize: 18, color: textColor),
                        )
                      ],
                    ),
                    FutureBuilder<List<Beverage>>(
                        future: loadBeverageData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error:${snapshot.error}'));
                          } else if (snapshot.hasData) {
                            final beverages = snapshot.data!;

                            return SizedBox(
                              height: SizeUtils.width * 0.74,
                              width: double.maxFinite,
                              child: Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    if (beverages[index].instantAvailability) {
                                      final instantBeverage = beverages[index];

                                      return ScrollCardTiles(
                                          instantBeverage: instantBeverage);
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            );
                          }

                          return const SizedBox();
                        })
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
