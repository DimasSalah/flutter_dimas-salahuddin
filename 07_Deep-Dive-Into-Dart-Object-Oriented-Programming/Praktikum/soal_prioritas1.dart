class BangunRuang {
  int panjang = 5;
  int lebar = 3;
  int tinggi = 2;

  int volume() {
    return panjang * lebar * tinggi;
  }
}

class Kubus extends BangunRuang {
  int sisi = 5;

  @override
  int volume() {
    return sisi * sisi * sisi; // Volume kubus
  }
}

class Balok extends BangunRuang {
  @override
  int volume() {
    return panjang * lebar * tinggi; // Volume balok
  }
}

void main() {
  var bangun = BangunRuang();
  var kubus = Kubus();
  var balok = Balok();

  print(kubus.volume()); // Output: 125
  print(balok.volume()); // Output: 30
  print(bangun.volume()); // Output: 30
}
