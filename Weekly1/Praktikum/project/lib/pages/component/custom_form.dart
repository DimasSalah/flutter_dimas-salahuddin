import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final String title;
  final bool? dense;
  final int? maxLines;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const CustomForm({
    super.key,
    required this.title,
    this.dense = false,
    this.maxLines = 1,
    this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Color.fromARGB(255, 173, 172, 172), fontWeight: FontWeight.w400),
      maxLines: maxLines,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        isDense: dense,
        filled: true,
        fillColor: const Color(0xFFECECEC),
        hintText: title,
        hintStyle:
            const TextStyle(color: Color(0xFFC3C3C3), fontWeight: FontWeight.w400),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Color(0xFFD9D9D9), width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Color(0xFFD9D9D9), width: 1),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
    );
  }
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email tidak boleh kosong';
  }
  if (!value.contains('@')) {
    return 'Email harus mengandung karakter "@"';
  }
  return null; // Return null jika validasi berhasil
}

String? validateUsername(String? value) {
  if (value == null || value.isEmpty) {
    return 'Username tidak boleh kosong';
  }
}
