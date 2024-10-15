import 'package:flutter/material.dart';

class GlowingText extends StatelessWidget {
  final List<Color> colors;
  final String text;
  final double strokeWidth;

  GlowingText({
    super.key,
    required this.text,
    List<Color>? colors,
    this.strokeWidth = 2.0,
  }) : colors = colors ?? [Colors.white, Colors.white.withOpacity(0.5)];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds);
            },
            child: Text(
              text,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color:
                    Colors.white, // This color will be overridden by ShaderMask
                shadows: [
                  Shadow(
                    color: Colors.white.withOpacity(0.6), // Glow effect
                    blurRadius: strokeWidth,
                  ),
                ],
              ),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Stroke color
              shadows: [
                Shadow(
                  color: Colors.black, // Stroke color
                  blurRadius: strokeWidth,
                  offset: const Offset(1, 1), // Adjust for stroke effect
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
