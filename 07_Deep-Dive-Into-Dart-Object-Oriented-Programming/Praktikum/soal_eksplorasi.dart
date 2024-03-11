import 'dart:math' as math;
abstract class BangunDatar {
  double getArea();
  double getPerimeter();
}

// Class Persegi
class Persegi implements BangunDatar {
  double sisi;
  Persegi(this.sisi);

  @override
  double getArea() {
    return sisi * sisi;
  }

  @override
  double getPerimeter() {
    return 4 * sisi;
  }
}

// Class Segitiga
class Segitiga implements BangunDatar {
  double alas;
  double tinggi;

  Segitiga(this.alas, this.tinggi);

  @override
  double getArea() {
    return (alas * tinggi) / 2;
  }

  @override
  double getPerimeter() {
    return alas + tinggi + math.sqrt(alas * alas + tinggi * tinggi);
  }
}

// Class Lingkaran
class Lingkaran implements BangunDatar {
  double jariJari;
  Lingkaran(this.jariJari);

  @override
  double getArea() {
    return math.pi * jariJari * jariJari;
  }

  @override
  double getPerimeter() {
    return 2 * math.pi * jariJari;
  }
}

// Fungsi main
void main() {
  Persegi persegi = Persegi(5);
  Segitiga segitiga = Segitiga(3, 4);
  Lingkaran lingkaran = Lingkaran(7);

  print("Persegi:");
  print("Luas: ${persegi.getArea()}");
  print("Keliling: ${persegi.getPerimeter()}");

  print("\nSegitiga:");
  print("Luas: ${segitiga.getArea()}");
  print("Keliling: ${segitiga.getPerimeter()}");

  print("\nLingkaran:");
  print("Luas: ${lingkaran.getArea()}");
  print("Keliling: ${lingkaran.getPerimeter()}");
}