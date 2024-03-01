void main() {

  //soal1
  List<String> dataDuplikat = ['js', 'js', 'js', 'golang', 'python', 'js', 'js', 'golang', 'rust'];

  // Mengubah list menjadi set untuk menghilangkan duplikat
  Set<String> dataUnik = dataDuplikat.toSet();

  // Mengubah set kembali menjadi list
  List<String> dataUnikList = dataUnik.toList();

  print('Soal 1 ; $dataUnikList');


  //soal2
  print('\nSoal 2;');
  // Map untuk menyimpan frekuensi
  Map<String, int> frekuensi = {};

  // Looping through the data
  for (String item in dataDuplikat) {
    // Menambahkan item ke map dan increment frekuensinya
    frekuensi[item] = frekuensi.containsKey(item) ? frekuensi[item]! + 1 : 1;
  }

  // Menampilkan hasil
  for (String key in frekuensi.keys) {
    print('$key: ${frekuensi[key]}');
  }
}
