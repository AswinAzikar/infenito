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
    return SizedBox(
      height: SizeUtils.width / 2,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(padding),
        child: GlassmorphicContainer(
          containerPadding: const EdgeInsets.all(paddingLarge),
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

                              //      return const SizedBox();
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
              Container(child: const Column()),
            ],
          ),
        ),
      ),
    );
  }
}
