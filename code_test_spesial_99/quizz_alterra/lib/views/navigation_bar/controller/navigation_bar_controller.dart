import 'package:flutter/material.dart';
import 'package:quizz_alterra/views/product/product_view.dart';

import '../../home/home_view.dart';
import '../../profile/profile_view.dart';

class NavigationBarControler extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  final screen = [
    const HomeView(),
    const ProductView(),
    const ProfileView(),
  ];
}