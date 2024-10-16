import 'package:flutter/material.dart';

class CircularImageContainer extends StatelessWidget {
  final String imageUrl; 
  final double radius; 
  final Color borderColor; 
  final double borderWidth; 

  const CircularImageContainer({
    super.key,
    required this.imageUrl,
    required this.radius,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2, 
      height: radius * 2, 
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: borderWidth),
        image: DecorationImage(
          image: AssetImage(imageUrl), 
          fit: BoxFit.cover, 
        ),
      ),
    );
  }
}
