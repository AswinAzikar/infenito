import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:infenito/Utils/size_utils.dart';
import 'package:infenito/constants/constants.dart';
import 'package:infenito/gen/assets.gen.dart';
import 'package:infenito/models/beverage.dart';
import 'package:infenito/themes/app_text_style.dart';
import 'package:infenito/widgets/glass_morphic_container.dart';

import 'widgets/custom_checkbox.dart';
import 'widgets/mini_button.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<int> list = List.generate(20, (index) => index + 1);

  int dropdownValue = 1;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final beverage = ModalRoute.of(context)!.settings.arguments as Beverage;
      _showBottomSheet(context, beverage);
    });
  }

  void _showBottomSheet(BuildContext context, Beverage beverage) {
    Gap gapW4 = Gap(SizeUtils.width * 0.01);
    Gap gapW8 = Gap(SizeUtils.width * 0.02);
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) => GlassmorphicContainer(
        borderColor: const Color(0xff777878),
        borderRadius: 30,
        backgroundColor: const Color(0xff525253),
        backgroundColorOpacity: 0.8,
        child: Padding(
          padding: const EdgeInsets.all(paddingLarge * 1.5),
          child: Wrap(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            beverage.name,
                            style:
                                context.inter60018.copyWith(color: textColor),
                          ),
                          Row(
                            children: [
                              Text(
                                beverage.rating.toString(),
                                style: context.inter40014.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xffc4c4c4),
                                ),
                              ),
                              Gap(SizeUtils.width * 0.02),
                              SvgPicture.asset(Assets.svgs.star),
                              Gap(SizeUtils.width * 0.02),
                              Text(
                                "(${beverage.numberOfRatings})",
                                style: context.inter40014.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xffc4c4c4),
                                ),
                              ),
                              Gap(SizeUtils.width * 0.03),
                              Builder(
                                builder: (context) {
                                  if (beverage.ingredientType == "veg") {
                                    return SvgPicture.asset(
                                      Assets.svgs.veg,
                                      height: 25.h,
                                    );
                                  } else if (beverage.ingredientType == "egg") {
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
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          DropdownMenu<int>(
                            menuHeight: SizeUtils.height * .5,
                            width: SizeUtils.width * 0.2,
                            inputDecorationTheme: const InputDecorationTheme(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              outlineBorder: BorderSide(color: Colors.grey),
                              filled: true,
                              fillColor: Color.fromARGB(255, 224, 221, 221),
                            ),
                            trailingIcon: const Icon(
                              Icons.arrow_drop_down,
                            ),
                            initialSelection: dropdownValue,
                            onSelected: (int? value) {
                              setState(() {
                                dropdownValue = value!;
                              });
                            },
                            dropdownMenuEntries:
                                list.map<DropdownMenuEntry<int>>((int value) {
                              return DropdownMenuEntry<int>(
                                value: value,
                                label: value.toString(),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  gapW4,
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        beverage.description,
                        style: TextStyle(color: textColor),
                      ))
                    ],
                  ),
                  gapW8,
                  Text(
                    "Choice of Cup Filling",
                    style: context.inter50016.copyWith(
                        fontWeight: FontWeight.w700, color: textColor),
                  ),
                  gapW4,
                  const Row(
                    children: [
                      MiniButton(
                        buttonLabels: [
                          "Full",
                          "1/2 Full",
                          "3/4 Full",
                          "1/4 Full"
                        ],
                      )
                    ],
                  ),
                  gapW8,
                  Text(
                    "Choice of  Milk ",
                    style: context.inter50016.copyWith(
                        fontWeight: FontWeight.w700, color: textColor),
                  ),
                  gapW4,
                  const OptionsGrid(
                    exclusiveSwitching: true,
                    options: [
                      "Skim",
                      "Almond",
                      "Soy",
                      "Lactose Free",
                      "Full Cream",
                      "Oat"
                    ],
                  ),
                  gapW4,
                  Text(
                    "Choice of Sugar",
                    style: context.inter50016.copyWith(
                        fontWeight: FontWeight.w700, color: textColor),
                  ),
                  gapW4,
                  const OptionsGrid(
                    exclusiveSwitching: true,
                    options: [
                      "Sugar X1",
                      "Sugar X2",
                      "1/2 Sugar",
                      "No Sugar",
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeUtils.width * 0.05),
                    height: SizeUtils.width * .2,
                    decoration: const BoxDecoration(
                        color: Color(0xff333333),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CustomCheckBox(),
                              gapW4,
                              Text(
                                "High Priority",
                                style: TextStyle(color: textColor),
                              ),
                              gapW4,
                              Image.asset(
                                Assets.pngs.error1.path,
                                height: 15,
                                width: 15,
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeUtils.width * .07,
                                vertical: SizeUtils.width * .03),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: buttonGreen),
                            child: Text(
                              "Submit",
                              style: context.inter40014.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ]),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final beverage = ModalRoute.of(context)!.settings.arguments as Beverage;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.pngs.signupBg.path,
            fit: BoxFit.cover,
            height: SizeUtils.height,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 456 / 549,
                child: Image.asset(
                  Assets.jpegs.cappucino.path,
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              Assets.svgs.darkShade,
              width: SizeUtils.width,
            ),
          ),
        ],
      ),
    );
  }
}
