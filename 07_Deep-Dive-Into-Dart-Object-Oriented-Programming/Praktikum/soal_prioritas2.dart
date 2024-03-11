class Matematika {
  int hasil() {
    return 0; 
  }
}

class KelipatanPersekutuanTerkecil implements Matematika {
  int x = 12;
  int y = 9;

  @override
  int hasil() {
    // Mencari Kelipatan Persekutuan Terkecil (KPK)
    int kpk = 1;
    int a = x;
    int b = y;
    while (a != b) {
      if (a < b) {
        a += x;
      } else {
        b += y;
      }
    }
    kpk = a;
    return kpk;
  }
}

class KelipatanPersekutuanTerbesar implements Matematika {
  int x = 12;
  int y = 9;
  
  @override
  int hasil() {
    // Mencari Kelipatan Persekutuan Terbesar (FPB)
    int fpb;
    int a = x;
    int b = y;
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }
    fpb = a;
    return fpb;
  }
}

void main() {
  var kpk = KelipatanPersekutuanTerkecil();
  var fpb = KelipatanPersekutuanTerbesar();

  print("Kelipatan Persekutuan Terkecil: ${kpk.hasil()}"); 
  print("Kelipatan Persekutuan Terbesar: ${fpb.hasil()}"); 
}
