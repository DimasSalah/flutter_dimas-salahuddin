// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateForm extends StatelessWidget {
  final DateTime dueDate;
  final void Function()? onTap;
  const DateForm({
    super.key,
    required this.dueDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            text: 'Date of Birth',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: ' *',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text(
                DateFormat('dd/MM/yyyy').format(dueDate),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: onTap,
                child: const Icon(
                  Icons.calendar_today,
                  size: 20,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
