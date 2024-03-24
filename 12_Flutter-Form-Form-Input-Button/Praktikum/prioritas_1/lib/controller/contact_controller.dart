class ContactController {
  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama tidak boleh kosong';
    }

    List<String> words = value.split(' ');

    for (String word in words) {
      //cek di awal kata harus huruf besar
      if (!RegExp(r'^[A-Z]').hasMatch(word)) {
        return 'Setiap kata harus diawali huruf besar';
      }

      // Periksa apakah kata mengandung angka atau karakter khusus
      if (RegExp(r'[0-9!@#%^&*(),.?":{}|<>]').hasMatch(word)) {
        return 'Nama tidak boleh mengandung angka atau karakter khusus';
      }
    }

    // Periksa apakah terdapat minimal dua kata
    if (words.length < 2) {
      return 'Nama harus terdiri dari minimal 2 kata';
    }

    return null;
  }


  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor telepon tidak boleh kosong';
    }

    // Periksa apakah nomor telepon terdiri dari angka saja
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Nomor telepon harus terdiri dari angka saja';
    }

    // Periksa apakah nomor telepon dimulai dengan angka 0
    if (!value.startsWith('0')) {
      return 'Nomor telepon harus dimulai dengan angka 0';
    }

    // Periksa panjang nomor telepon
    if (value.length < 8 || value.length > 15) {
      return 'Panjang nomor telepon harus 8-15 digit';
    }

    return null;
  }
}
