import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateFormCubit extends Cubit<DateTime> {
  DateFormCubit() : super(DateTime.now());

  Future<void> updateDueDate(DateTime newDate) async {
    emit(newDate);
  }
}

class ColorCubit extends Cubit<Color> {
  ColorCubit() : super(const Color(0xffffffff));

  void changeColor(Color newColor) {
    emit(newColor);
  }
}

class FileNameCubit extends Cubit<String> {
  FileNameCubit() : super('Open File');

  void updateFileName(String newFileName) {
    emit(newFileName);
  }
}