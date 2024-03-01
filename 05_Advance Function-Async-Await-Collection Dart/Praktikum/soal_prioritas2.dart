
Future<int> hitungFaktorial(int n) async {
  // Menghitung faktorial 
  if (n == 0) {
    return 1;
  } else {
    return n * await hitungFaktorial(n - 1);
  }
}


void main() async {

//Soal 1
  // Membuat list dengan sub-list yang berisi 2 elemen
  List<List<dynamic>> dataList = [
    ['a', 1],
    ['b', 2],
    ['c', 3],
    ['d', 4],
  ];

  // Membuat map dari list
  Map<String, int> dataMap = Map.fromIterable(
    dataList,
    key: (item) => item[0],
    value: (item) => item[1],
  );
  print('soal 1');
  print(dataMap);


  List<int> nilai = [7, 5, 3, 5, 2, 1];

  // Menghitung total nilai
  int totalValue = 0;
  for (int nilaiIndividu in nilai) {
    totalValue += nilaiIndividu;
  }

  // Menghitung rata-rata
  double rataRata = totalValue / nilai.length;

  // Membulatkan ke atas
  int hasilBulatan = rataRata.ceil();

  // Menampilkan hasil
  print('\nSoal 2');
  print('Rata-rata: $rataRata');
  print('Rata-rata bulat ke atas: $hasilBulatan');


  //soal 3

  // Bilangan yang ingin dihitung faktorialnya
  int n = 5;

  // Menghitung faktorial secara asinkron
  Future<int> hasilFaktorial = hitungFaktorial(n);

  // Menunggu hasil perhitungan
  int faktorial = await hasilFaktorial;

  // Menampilkan hasil
  print('\nSoal 3\nFaktorial $n: $faktorial');
}
