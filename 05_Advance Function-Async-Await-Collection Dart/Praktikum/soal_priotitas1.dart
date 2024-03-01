//fungsi untuk soal 1
Future<List<int>> listPerkalian(List<int> listData, int pengkalian) async {
  List<int> hasil = [];

  //Perulangan asynchronous pada list data
  await Future.forEach(listData, (int element) async {
    int dataHasil = element * pengkalian;
    hasil.add(dataHasil);
  });

  return hasil;
}

//fungsi untuk soal 2
void countDataType(List<dynamic> data) {
  int stringCount = 0;
  int boolCount = 0;
  int intCount = 0;
  int doubleCount = 0;

  for (dynamic element in data) {
    if (element is String) {
      stringCount++;
    } else if (element is bool) {
      boolCount++;
    } else if (element is int) {
      intCount++;
    } else if (element is double) {
      doubleCount++;
    }
  }

  print('Jumlah String: $stringCount');
  print('Jumlah Boolean: $boolCount');
  print('Jumlah Integer: $intCount');
  print('Jumlah Double: $doubleCount');
}

void main() async {
  List<int> data = [1, 2, 3, 4, 5];
  int pengkalian = 5;

  List<int> result = await listPerkalian(data, pengkalian);
  print('Soal 1: $result');

  List<dynamic> data2 = ['halo', 2, 3, 4.0, true, 'hai', 5, 6.0, false, true];
  print('\nSoal 2:');
  countDataType(data2);
}
