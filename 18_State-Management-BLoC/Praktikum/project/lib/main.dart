import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prioritas_1/bloc/contact_bloc.dart';
import 'package:prioritas_1/pages/contact/contact_view.dart';
import 'bloc/contact_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ContactBloc()
              ..add(
                GetContact(),
              ),
          ),
          BlocProvider(create: (_) => DateFormCubit()),
          BlocProvider(create: (_) => ColorCubit()),
          BlocProvider(create: (_) => FileNameCubit()),
        ],
        child: ContactView(),
      ),
      // initialRoute: '/contact',
      // routes: {
      //   '/contact': (_) => const ContactView(),
      //   '/gallery': (_) => GalleryView(),
      //   '/detail': (_) => DetailScreen(),
      // },
    );
  }
}
