import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

import '../../model/contact_model.dart';

class ContactController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final List<Contact> _resultContacts = [];
  List<Contact> get resultContacts => _resultContacts;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  DateTime _dueDate = DateTime.now();
  DateTime get dueDate => _dueDate;

  final currentDate = DateTime.now();
  Color currentColor = Colors.white;

  String fileName = 'Open File';

  void setDueDate(DateTime newDate) {
    _dueDate = newDate;
    notifyListeners();
  }

  void setColor(Color color) {
    currentColor = color;
    notifyListeners();
  }

  void setFileName() {
    if (fileName == 'Open File') {
      fileName = 'No File Selected';
    }
    notifyListeners();
  }

  void editContact(int index,) {
    nameController.text = _resultContacts[index].name;
    phoneController.text = _resultContacts[index].phoneNumber;
    currentColor = _resultContacts[index].color;
    _dueDate = _resultContacts[index].birthDate;
    fileName = _resultContacts[index].fileName;
    _resultContacts.removeAt(index);
    notifyListeners();
  }

  void removeContact(int index) {
    _resultContacts.removeAt(index);
    notifyListeners(); 
  }

  void submitContact() {
    if (formKey.currentState!.validate()) {
      _resultContacts.add(
        Contact(
          name: nameController.text,
          phoneNumber: phoneController.text,
          color: currentColor,
          birthDate: _dueDate,
          fileName: fileName,
        ),
      );
      nameController.clear();
      phoneController.clear();
      currentColor = Colors.white;
      _dueDate = DateTime.now();
      fileName = 'Open File';
      notifyListeners();
    }
  }


  Future<void> onTapFilePicker() async {
    final fileNamePath = await pickFile();
    if (fileNamePath != 'no file selected') {
      fileName = fileNamePath;
      notifyListeners();
    }
  }

  Future<String> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return 'no file selected';

    final file = result.files.first;
    openFile(file);
    final String namePath = file.name;
    return namePath; 
  }

  void openFile(PlatformFile file) async {
    OpenFile.open(file.path);
  }

  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    List<String> words = value.split(' ');
    for (String word in words) {
      if (!RegExp(r'^[A-Z]').hasMatch(word)) {
        return 'Setiap kata harus diawali huruf besar';
      }
      if (RegExp(r'[0-9!@#%^&*(),.?":{}|<>]').hasMatch(word)) {
        return 'Nama tidak boleh mengandung angka atau karakter khusus';
      }
    }
    if (words.length < 2) {
      return 'Nama harus terdiri dari minimal 2 kata';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor telepon tidak boleh kosong';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Nomor telepon harus terdiri dari angka saja';
    }
    if (!value.startsWith('0')) {
      return 'Nomor telepon harus dimulai dengan angka 0';
    }
    if (value.length < 8 || value.length > 15) {
      return 'Panjang nomor telepon harus 8-15 digit';
    }
    return null;
  }

  

  void disposeControllers() {
    nameController.dispose();
    phoneController.dispose();
  }

  
}
