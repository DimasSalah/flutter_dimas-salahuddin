void main() {
  int angka = 19; 

  //fungsi untuk mengecek apakah bilangan  bilangan prima atau bukan eksplorasi no 1
  if (prima(angka)) {
    print('$angka adalah bilangan prima\n');
  } else {
    print('$angka bukan bilangan prima\n');
  }

  // Membuat tabel perkalian ekplorasi no 2
  int nilai = 8; 
  // Membuat tabel perkalian 
  for (int i = 1; i <= nilai; i++) {
    String row = '';
    for (int j = 1; j <= nilai; j++) {
      // Menghitung hasil perkalian
      int hasil = i * j;
      // Menambahkan hasil perkalian ke dalam baris
      row += '$hasil ';
    }
    // Mencetak baris
    print(row);
  }
}

// Fungsi untuk mengecek apakah sebuah bilangan adalah bilangan prima
bool prima(int angka) {
  if (angka <= 1) {
    return false;
  }
  for (int i = 2; i <= angka / 2; i++) {
    if (angka % i == 0) {
      return false;
    }
  }
  return true;
}
