import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'components/carousel_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome !',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Text(
              'Dimas Salahuddin',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 20),
            CarouselSlider(
              options: CarouselOptions(
                height: 500.0,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                viewportFraction: 1.5,
              ),
              items: const [
                CarouselItem(
                  imageAssetPath: 'assets/images/1.jpg',
                ),
                CarouselItem(
                  imageAssetPath: 'assets/images/2.jpg',
                ),
              ],
            ),

      
          ],
        ),
      ),
    );
  }
}
