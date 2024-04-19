import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_alterra/views/add_product/add_product_view.dart';
import 'package:quizz_alterra/views/home/home_view.dart';

import 'views/add_product/controller/add_product_controller.dart';
import 'views/navigation_bar/controller/navigation_bar_controller.dart';
import 'views/navigation_bar/navigation_bar_view.dart';
import 'views/product/product_view.dart';
import 'views/profile/profile_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NavigationBarControler(),
        ),
        ChangeNotifierProvider(
      create: (_) => AddProductController(),
    ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        initialRoute: '/navigation-bar',
        routes: {
          '/home': (_) => const HomeView(),
          '/product': (_) => const ProductView(),
          '/add-product': (_) => const AddProductView(),
          '/profile': (_) => const ProfileView(),
          '/navigation-bar': (_) => const NavigationBarView(),
        },
      ),
    );
  }
}
