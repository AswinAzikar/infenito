import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infenito/Utils/size_utils.dart';
import 'package:infenito/constants/constants.dart';
import 'package:infenito/gen/assets.gen.dart';
import 'package:infenito/models/beverage.dart';
import 'package:infenito/themes/app_text_style.dart';
import 'package:infenito/views/signup_screen.dart';
import 'package:infenito/widgets/glass_morphic_container.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final beverage = ModalRoute.of(context)!.settings.arguments as Beverage;
      _showBottomSheet(context, beverage);
    });
  }

  void _showBottomSheet(BuildContext context, Beverage beverage) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) => GlassmorphicContainer(
            //    containerPadding: const EdgeInsets.all(padding),
            borderColor: Colors.grey,
            borderRadius: 30,
            backgroundColor: const Color(0xff525253),
            backgroundColorOpacity: 0.6,
            child: Padding(
              padding: const EdgeInsets.all(paddingLarge),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            beverage.name,
                            style:
                                context.inter60018.copyWith(color: textColor),
                          )
                        ],
                      ),
                      const Column()
                    ],
                  )
                ],
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    final beverage = ModalRoute.of(context)!.settings.arguments as Beverage;
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(Assets.pngs.signupBg.path,
            fit: BoxFit.cover, height: SizeUtils.height),
        Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 456 / 549,
              child: Image.asset(
                Assets.jpegs.cappucino.path,
              ),
            ),
          ],
        )),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              Assets.svgs.darkShade,
              width: SizeUtils.width,
            )),
      ],
    ));
  }
}
