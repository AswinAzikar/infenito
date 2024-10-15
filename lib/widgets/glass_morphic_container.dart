import 'dart:ui';
import 'package:flutter/material.dart';

class GlassmorphicContainer extends StatelessWidget {
  final double borderRadius;
  final Color borderColor;
  final bool enableLeftCornerBorder;
  final double borderThickness;

  const GlassmorphicContainer({
    super.key,
    this.borderThickness = 1,
    this.borderRadius = 20.0,
    this.enableLeftCornerBorder = false,
    this.borderColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 211, 192, 192).withOpacity(0.1),
                borderRadius: BorderRadius.circular(borderRadius),
                border: enableLeftCornerBorder
                    ? null
                    : Border.all(color: borderColor, width: borderThickness),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: const Column(
                    children: [
                      //TODO: SignUpScreen Elements
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
