import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_alterra/views/navigation_bar/controller/navigation_bar_controller.dart';

class NavigationBarView extends StatelessWidget {
  const NavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<NavigationBarControler>(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: controller.selectedIndex,
        onDestinationSelected: (int index) {
          controller.setSelectedIndex(index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: 'Product',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: controller.screen[controller.selectedIndex],
    );
  }
}