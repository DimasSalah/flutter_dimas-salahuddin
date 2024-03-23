import 'package:flutter/material.dart';
import 'package:pw_prioritas1/pages/setting_view.dart';

import 'pages/home_view.dart';
import 'pages/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(useMaterial3: true, ),
      initialRoute: '/navigationbar',
      routes: {
        '/home': (_) => const MyHomePage(),
        '/settings': (_) => const SettingPage(),
        '/navigationbar': (_) =>  const NavBarControl(),
      },
    );
  }
}


