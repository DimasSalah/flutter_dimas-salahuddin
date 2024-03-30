import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class ContactController {
  // String fileNamePath = '';

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
}
