import 'package:flutter/material.dart';

class InformationView extends StatelessWidget {
  const InformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Information"),
      ),
      body: const Center(
        child: Text("Information View"),
      ),
    );
  }
}