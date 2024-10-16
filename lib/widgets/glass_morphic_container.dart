// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infenito/Utils/size_utils.dart';

import 'package:infenito/constants/constants.dart';
import 'package:infenito/gen/assets.gen.dart';

class GlassmorphicContainer extends StatelessWidget {
  final bool enableNoise;
  final double borderRadius;
  final Color borderColor;
  final bool enableLeftCornerBorder;
  final double borderThickness;
  final Color backgroundColor;
  final Widget? child;
  final double backgroundColorOpacity;
  final EdgeInsets containerPadding;
  const GlassmorphicContainer(
      {super.key,
      this.borderRadius = paddingLarge / 2,
      this.borderColor = Colors.white,
      this.enableLeftCornerBorder = false,
      this.borderThickness = 1,
      this.backgroundColor = const Color.fromARGB(255, 211, 192, 192),
      this.backgroundColorOpacity = 0.1,
      this.enableNoise = false,
      this.child,
      this.containerPadding = const EdgeInsets.all(0)});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: containerPadding,
          decoration: BoxDecoration(
            color: backgroundColor.withOpacity(backgroundColorOpacity),
            borderRadius: BorderRadius.circular(borderRadius),
            border: enableLeftCornerBorder
                ? null
                : Border.all(color: borderColor, width: borderThickness),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: child ?? const SizedBox(),
            ),
          ),
        ),
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              enableNoise
                  ? SvgPicture.asset(
                      height: SizeUtils.height,
                      Assets.svgs.grainy,
                      fit: BoxFit.fill,
                    )
                  : const SizedBox(),
        ),
      ],
    );
  }
}
