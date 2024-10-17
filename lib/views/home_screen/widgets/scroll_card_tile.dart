import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:infenito/constants/constants.dart';
import 'package:infenito/themes/app_text_style.dart';

import '../../../Utils/size_utils.dart';
import '../../../gen/assets.gen.dart';
import '../../../models/beverage.dart';
import '../../../widgets/glass_morphic_container.dart';

class ScrollCardTiles extends StatelessWidget {
  const ScrollCardTiles({
    super.key,
    required this.instantBeverage,
  });

  final Beverage instantBeverage;

  @override
  Widget build(BuildContext context) {
    double contPadding = paddingLarge;

    return SizedBox(
      height: SizeUtils.width / 2,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(padding),
        child: GlassmorphicContainer(
          borderRadius: 20,
          containerPadding: EdgeInsets.all(contPadding),
          backgroundColorOpacity: 1,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 30,
              offset: const Offset(0, 10),
              spreadRadius: 5,
            ),
          ],
          backgroundColor: const Color(0xff736e70),
          borderColor: Colors.transparent,
          borderThickness: 0,
          child: Row(
            children: [
              SizedBox(
                width: SizeUtils.width / 1.8,
                child: Padding(
                  padding: const EdgeInsets.all(paddingSmall),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        instantBeverage.name,
                        style: context.inter50016
                            .copyWith(color: textColor, fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(instantBeverage.rating.toString()),
                              Gap(SizeUtils.width * .01),
                              SvgPicture.asset(Assets.svgs.star),
                              Gap(SizeUtils.width * .01),
                              Text("(${instantBeverage.numberOfRatings})"),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: SizeUtils.width * 0.05),
                            child: Builder(
                              builder: (context) {
                                if (instantBeverage.ingredientType == "veg") {
                                  return SvgPicture.asset(
                                    Assets.svgs.veg,
                                    height: 25.h,
                                  );
                                } else {
                                  if (instantBeverage.ingredientType == "egg") {
                                    return SvgPicture.asset(
                                      Assets.svgs.eggerian,
                                      height: 25.h,
                                    );
                                  } else {
                                    return SvgPicture.asset(
                                      Assets.svgs.nonVeg,
                                      height: 25.h,
                                    );
                                  }
                                }
                              },
                            ),
                          )
                        ],
                      ),
                      Gap(SizeUtils.width * 0.02),
                      Expanded(
                          child: Text(
                        instantBeverage.description,
                        style: const TextStyle(color: Color(0xffC0C0C0)),
                      ))
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(padding),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                width: 125.h,
                                height: 300.h,
                                child: Builder(
                                  builder: (context) {
                                    int random = Random().nextInt(2);
                                    if (random == 0) {
                                      return Image.asset(
                                        Assets.jpegs.cappucino.path,
                                        fit: BoxFit.cover,
                                      );
                                    } else {
                                      return Image.asset(
                                        Assets.jpegs.latte.path,
                                        fit: BoxFit.cover,
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: SizeUtils.width * 0.1),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/detailScreen',
                                      arguments: instantBeverage);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: paddingSmall),
                                  decoration: BoxDecoration(
                                      color: buttonGreen,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Add",
                                        style: context.inter40014.copyWith(
                                            fontSize: 12, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
