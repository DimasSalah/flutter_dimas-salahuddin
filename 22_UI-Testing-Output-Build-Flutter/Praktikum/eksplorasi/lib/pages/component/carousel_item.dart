
import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  final String imageAssetPath;
  final String title;
  final String description;

  const CarouselItem({
    super.key,
    required this.imageAssetPath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Image.asset(
            imageAssetPath,
            height: 300,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            description,
            style: const TextStyle(
              color: Color(0xFFC3C3C3),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}