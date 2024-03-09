class Animal {
  int weight;
  Animal(this.weight);
}

class Car {
  int capacity;
  List<Animal> cargo;
  Car(this.capacity) : cargo = [];

  void addAnimal(Animal animal) {
    if (capacity >= animal.weight + totalLoad()) {
      cargo.add(animal);
    } else {
      print("Mobil sudah penuh tidak dapat menambahkan hewan.");
    }
  }

  int totalLoad() {
    return cargo.fold(0, (sum, animal) => sum + animal.weight);
  }
}

void main() {
  var car = Car(500); //kapasitas mobil
  Animal singa = Animal(250); //berat hewan
  car.addAnimal(singa); //tambahkan hewan ke dalam mobil
  print(car.totalLoad()); //print total berat hewan di dalam mobil
}
