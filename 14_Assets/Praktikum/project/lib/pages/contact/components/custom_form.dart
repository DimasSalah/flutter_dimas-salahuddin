import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final TextEditingController nameController;
  final String title;
  final TextInputType inputType;
  final String? Function(String?)? validatorInput;
  const CustomForm({
    super.key,
    required this.nameController,
    required this.title,
    required this.inputType,
    required this.validatorInput,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
            children: const <TextSpan>[
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
        TextFormField(
          autovalidateMode: AutovalidateMode.disabled,
          controller: nameController,
          keyboardType: inputType,
          decoration: InputDecoration(
            hintText: 'Enter your $title',
            hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          ),
          validator: validatorInput,
        ),
      ],
    );
  }
}
