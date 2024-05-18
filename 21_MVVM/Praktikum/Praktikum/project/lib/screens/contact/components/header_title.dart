import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create New Contact',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.phone,
              size: 27,
            ),
          ],
        ),
        SizedBox(
          height: 2,
        ),
        Text(
            'create new contact here with fill the form below, every form must be filled with valid data!',
            style: TextStyle(fontSize: 16, color: Colors.black45),
            textAlign: TextAlign.center),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
