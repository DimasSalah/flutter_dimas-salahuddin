import 'package:flutter/material.dart';
import 'package:prioritas_1/pages/contact/contact_view.dart';
import 'package:prioritas_1/pages/gallery/detail_screen.dart';
import 'package:prioritas_1/pages/gallery/gallery_view.dart';
import 'package:provider/provider.dart';
import 'pages/contact/controller/contact_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ContactController())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        initialRoute: '/contact',
        routes: {
          '/contact': (_) => const ContactView(),
          '/gallery': (_) => GalleryView(),
          '/detail': (_) => const DetailScreen(),
        },
      ),
    );
  }
}
