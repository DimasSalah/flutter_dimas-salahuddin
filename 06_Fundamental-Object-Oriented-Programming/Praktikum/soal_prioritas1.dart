
//membuat class hewan
class Hewan {
  int berat;

  Hewan(this.berat);
}

//membuat class mobil
class Mobil {
  int kapasitas;
  List<Hewan> muatan = [];

  Mobil(this.kapasitas);

  //menghitung total berat muatan
  int totalMuatan() {
    int total = 0;
    for (Hewan hewan in muatan) {
      total += hewan.berat;
    }
    return total;
  }

  //method untuk menambahkan hewan ke dalam muatan
  void tambahMuatan(Hewan hewan) {
    if (totalMuatan() + hewan.berat <= kapasitas) {
      muatan.add(hewan);
      print('Hewan ditambahkan ke dalam muatan.');
    } else {
      print('Tidak dapat menambahkan hewan dalam muatan karena melebihi kapasitas.');
    }
  }

  
}

void main() {
  Hewan singa = Hewan(40);

  //mengisi kapasitas mobil
  Mobil truk = Mobil(50);  
  truk.tambahMuatan(singa);

}