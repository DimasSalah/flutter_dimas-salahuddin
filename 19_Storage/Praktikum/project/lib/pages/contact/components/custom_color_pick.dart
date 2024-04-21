import 'package:flutter/material.dart';

class CustomColorPicker extends StatelessWidget {
  final Color currentColor;
  final Widget child;
  const CustomColorPicker({
    super.key,
    required this.currentColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Color Picker',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(
                    'Pick a color',
                    style: TextStyle(fontSize: 20),
                  ),
                  content: SizedBox(
                    height: 300,
                    child: child,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
              width: 160,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: currentColor,
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.colorize_sharp,
                size: 20,
              )),
        )
      ],
    );
  }
}
