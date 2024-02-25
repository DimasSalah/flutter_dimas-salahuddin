
bool isPalindrom(String kata) {
  String kataBalik = kata.split('').reversed.join('');
  return kata == kataBalik;
}

void main() {
  print('Soal Eksplorasi');
  // Soal 1
  String kata = "kasur rusak";

  if (isPalindrom(kata)) {
    print("$kata adalah palindrom");
  } else {
    print("$kata bukan palindrom");
  }

  // Soal 2
  int bilangan = 24;
  print("\nFaktor dari $bilangan adalah:");
  for (int i = 1; i <= bilangan; i++) {
    if (bilangan % i == 0) {
      print(i);
    }
  }
}
