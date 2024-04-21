import 'package:flutter/material.dart';
import 'package:prioritas_1/pages/contact/contact_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/contact/controller/contact_controller.dart';
import 'pages/login/controller/login_controller.dart';
import 'pages/login/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isUserLoggedIn = prefs.getBool('isLogin') ?? false;
  runApp(MyApp(isUserLoggedIn: isUserLoggedIn));
  
}

class MyApp extends StatelessWidget {
  final bool isUserLoggedIn;

  const MyApp({super.key, required this.isUserLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContactController()..init()),
        ChangeNotifierProvider(create: (_) => LoginController())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        initialRoute: isUserLoggedIn == true ? '/contact' : '/login',
        routes: {
          '/contact': (_) => const ContactView(),
          '/login': (_) => const LoginView(),
        },
      ),
    );
  }
}
