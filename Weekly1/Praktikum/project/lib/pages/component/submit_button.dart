import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final void Function()? onTap;
  const SubmitButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: 10, horizontal: 12),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.85),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 40,
              ),
              const Text(
                'Submit Feedback',
                style:
                    TextStyle(color: Colors.white, fontSize: 16),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color(0xFF84F269),
                    Color(0xFFEBFF6D),
                  ]),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(
                  Icons.telegram,
                  color: Colors.black,
                  size: 30,
                ),
              )
            ],
          )),
    );
  }
}