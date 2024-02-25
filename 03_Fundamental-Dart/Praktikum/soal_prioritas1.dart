void main() {
  print('Prioritas 1');
  // Soal 1
  //Persegi
  var sisi = 10;
  var keliling = sisi * 4;
  var luas = sisi * sisi;
  
  //Persegi Panjang
  var panjang = 10;
  var lebar = 5;
  var kelilingPersegiPanjang = 2 * (panjang + lebar);
  var luasPersegiPanjang = panjang * lebar;

  //print hasil
  print('Soal 1');
  print('Keliling Persegi: $keliling cm dan Luas Persegi: $luas cm2');
  print('Keliling Persegi Panjang: $kelilingPersegiPanjang cm dan Luas Persegi Panjang: $luasPersegiPanjang cm2\n');

  // Soal 2
  //lingkaran
  var jariJari = 7;
  var kelilingLingkaran = 2 * 3.14 * jariJari;
  var luasLingkaran = 3.14 * jariJari * jariJari;
  print('Soal 2');
  print("Keliling Lingkaran: $kelilingLingkaran cm dan Luas Lingkaran: $luasLingkaran cm2\n");
  // Soal 3
  //null safety and non-null safety
  int? number;
  int number2 = 10;
  print('Soal 3');
  print('null safety value: ${number ?? '15'}');
  print('non-null safety value: $number2'); 
}