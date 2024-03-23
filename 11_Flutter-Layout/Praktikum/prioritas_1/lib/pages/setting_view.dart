import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Settings Page'),
      ),
    );
  }
}