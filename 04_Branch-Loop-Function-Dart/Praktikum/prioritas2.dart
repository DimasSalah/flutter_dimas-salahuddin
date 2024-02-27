import 'dart:io';

void main() {
  print('Piramida');
  for (int i = 1; i <= 5; i++) {
    String hasil = '';
    // Menambahkan spasi sebelum karakter '*'
    hasil += ' ' * (5 - i);
    // Menambahkan karakter '*' sebanyak (2 * i - 1)
    hasil += '*' * (2 * i - 1);
    // Menambahkan spasi setelah karakter '*' sampai 5
    hasil += ' ' * (5 - i);
    print(hasil);
  }

  print('\nJam Pasir');
  int i, j, k, n = 10;
  //perulangan untuk membuat bagian atas jam pasir
  for (i = 0; i <= n - 1; i++) {
    //menambahkan spasi sebelum karakter '0'
    for (j = 0; j < i; j++) {
      stdout.write(" ");
    }
    //menambahkan karakter '0' sebanyak (n - i)
    for (k = i; k <= n - 1; k++) {
      stdout.write("0" + " ");
    }
    stdout.writeln("");
  }
  //perulangan untuk membuat bagian bawah jam pasir
  for (i = n - 1; i >= 0; i--) {
    //menambahkan spasi sebelum karakter '0'
    for (j = 0; j < i; j++) {
      stdout.write(" ");
    }
    //menambahkan karakter '0' sebanyak (n - i)
    for (k = i; k <= n - 1; k++) {
      stdout.write("0" + " ");
    }
    stdout.writeln("");
  }
}