import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../helper/database.dart';
import '../../../model/contact_model.dart';

class ContactController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final DatabaseHelper databaseHelper = DatabaseHelper();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  List<ContactModel> _resultContacts = [];
  DateTime _dueDate = DateTime.now();
  int idCounter = 0;

  List<ContactModel> get resultContacts => _resultContacts;
  DateTime get dueDate => _dueDate;

  final currentDate = DateTime.now();
  Color currentColor = Colors.white;

  String fileName = 'Open File';

  //function to load username from shared preferences
  Future<String> loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ?? '';
  }  


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

  void removeContact(int index) {
    _resultContacts.removeAt(index);
    notifyListeners();
  }

  //contact fetch from database
  Future<void> fetchContacts() async {
    await databaseHelper.initDB();
    _resultContacts = await databaseHelper.getAllContacts();
    notifyListeners();
  }

  //contact insert to database
  Future<void> submitContact() async {
    if (formKey.currentState!.validate()) {
      final contact = ContactModel(
        name: nameController.text,
        phone: phoneController.text,
        color: currentColor.value.toRadixString(16).padLeft(8, '0').substring(2),
        birthDate: DateFormat('yyyy-MM-dd').format(_dueDate),
        fileName: fileName,
      );
      await databaseHelper.insertContact(contact);
      currentColor = Colors.white;
      _dueDate = DateTime.now();
      fileName = 'Open File';
      nameController.clear();
      phoneController.clear();
      await fetchContacts();
      notifyListeners();
    }
  }

  //contact update to database
  Future<void> updateContact(ContactModel contact) async {
    await databaseHelper.updateContact(contact);
    await fetchContacts();
    notifyListeners();
  }

  //contact delete to database
  Future<void> deleteContact(int id) async {
    await databaseHelper.deleteContact(id);
    await fetchContacts();
    notifyListeners();
  }

  init() {
    fetchContacts();
    notifyListeners();
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

}
