import 'package:flutter/material.dart';

class ListTileCard extends StatelessWidget {
  final String title;
  const ListTileCard({
    super.key,
    required this.title,
  });

  final Color deepBlue = const Color.fromARGB(255, 5, 92, 199);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: deepBlue),
      ),
      leading: Icon(Icons.laptop, color: deepBlue),
      trailing: Icon(
        Icons.arrow_forward,
        color: deepBlue,
      ),
    );
  }
}