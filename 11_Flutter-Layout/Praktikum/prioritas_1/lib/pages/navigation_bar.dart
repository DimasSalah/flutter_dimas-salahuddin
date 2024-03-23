import 'package:flutter/material.dart';

import 'home_view.dart';
import 'setting_view.dart';

class NavBarControl extends StatefulWidget {
   const NavBarControl({super.key});

  @override
  State<NavBarControl> createState() => _NavBarControlState();
}

class _NavBarControlState extends State<NavBarControl> {
   int selectedIndex = 0;

  final screen = [
    const MyHomePage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: screen[selectedIndex],
    );
  }
}
