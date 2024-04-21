import 'package:flutter/material.dart';

import '../controller/contact_controller.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    super.key,
    required this.controller,
  });

  final ContactController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<String>(
          future: controller.loadUsername(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('Loading...');
            } else {
              String username = snapshot.data ?? '';
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome, $username!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.phone,
                    size: 27,
                  ),
                ],
              );
            }
          },
        ),
        SizedBox(height: 2),
        Text(
          'create new contact here with fill the form below, every form must be filled with valid data!',
          style: TextStyle(fontSize: 16, color: Colors.black45),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
