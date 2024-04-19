
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CarouselItem extends StatelessWidget {
  final String imageAssetPath;

  const CarouselItem({
    super.key,
    required this.imageAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              imageAssetPath,
              height: 500,
            ),
          ),
        ],
      ),
    );
  }
}