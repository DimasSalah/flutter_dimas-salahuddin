class calculator {
  //membuat class calculator
  int add(int a, int b) {
    //membuat method add dengan parameter a dan b
    return a + b; //mengembalikan nilai penjumlahan a + b
  }

  int subtract(int a, int b) {
    return a - b; //mengembalikan nilai pengurangan a - b
  }

  int multiply(int a, int b) {
    return a * b; //mengembalikan nilai perkalian a * b
  }
  
  double divide(int a, int b) {
    return a / b; //mengembalikan nilai pembagian a / b
  }
}
void main() {
  var calc = calculator();
  print("Penjumlahan: ${calc.add(6, 3)}"); //memanggil method penjumlahan
  print("Pengurangan: ${calc.subtract(6, 3)}"); //memanggil method pengurangan
  print("Perkalian: ${calc.multiply(6, 3)}"); //memanggil method perkalian
  print("Pembagian: ${calc.divide(6, 3)}"); //memanggil method pembagian
}
