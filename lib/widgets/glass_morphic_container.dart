// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:infenito/constants/constants.dart';

class GlassmorphicContainer extends StatelessWidget {
  final double borderRadius;
  final Color borderColor;
  final bool enableLeftCornerBorder;
  final double borderThickness;

  final Widget? child;

  const GlassmorphicContainer({
    super.key,
    this.borderRadius = paddingLarge / 2,
    this.borderColor = Colors.white,
    this.enableLeftCornerBorder = false,
    this.borderThickness = 1,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 211, 192, 192).withOpacity(0.1),
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
      ],
    );
  }
}
