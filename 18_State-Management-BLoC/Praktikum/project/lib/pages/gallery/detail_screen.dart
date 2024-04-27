import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final image = ModalRoute.of(context)?.settings.arguments;
    return Image.asset('$image');
    // Image.asset(ImagePath);
  }
}
