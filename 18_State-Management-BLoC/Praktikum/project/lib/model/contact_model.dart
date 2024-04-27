import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ContactModel extends Equatable {
  final String name;
  final String phoneNumber;
  final Color color;
  final String birthDate;
  final String fileName;

  const ContactModel({
    required this.name,
    required this.phoneNumber,
    required this.color,
    required this.birthDate,
    required this.fileName,
  });

  @override
  List<Object> get props => [name,phoneNumber, color, birthDate, fileName];
}
