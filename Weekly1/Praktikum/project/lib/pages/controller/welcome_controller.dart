class Controller {
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
    return null;
  }

  String? validateFeedback(String? value) {
    if (value == null || value.isEmpty) {
      return 'Feedback tidak boleh kosong';
    }
    return null;
  }
}
