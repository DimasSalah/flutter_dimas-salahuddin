 
//inisialisasi fungsi daftarNilai untuk soal nomor 1
String daftarNilai(int nilai){
  if (nilai > 70) {
    return "Nilai A";
  } else if (nilai > 40) {
    return "Nilai B";
  } else if (nilai > 0) {
    return "Nilai C";
  } else {
    return "";
  }
}

//membuat list buah
List buah = [
  'Apple', 'Banana', 'Avocado', 'Cherry', 'Mango', 'Apricot', 'Blueberry', 'Acerola', 'Grape', 'Almond'
];

void main() {
  print('Soal 1 Branching');

  int nilai = 80;
  print("$nilai mendapatkan ${daftarNilai(nilai)}");

  nilai = 50;
  print("$nilai mendapatkan ${daftarNilai(nilai)}");

  nilai = 30;
  print("$nilai mendapatkan ${daftarNilai(nilai)}");

  nilai = 0;
  print("$nilai mendapatkan ${daftarNilai(nilai)}\n");

  print('Soal 1 Looping');
  for (int i = 0; i < 10; i++) {
    print("Perulangan ke-$i");
  }

  print('\nSoal 2 Looping');
  //membuat  perulangan untuk menampilkan buah yang diawali huruf 'A'
  for (String item in buah) {
    if (item.startsWith('A')) {
      print(item);
    }
  }


}