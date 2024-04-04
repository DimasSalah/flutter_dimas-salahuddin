import 'package:flutter/material.dart';

class CustomFilePicker extends StatelessWidget {
  final String fileName;
  final void Function()? onTap;
  const CustomFilePicker({super.key,
    required this.fileName,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(36),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 5,
            ),
            Text(
              fileName,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.file_present,
              size: 20,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
