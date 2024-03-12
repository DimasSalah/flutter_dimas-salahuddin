class Book {
  String id;
  String title;
  String publisher;
  double price;
  String category;

  Book(this.id, this.title, this.publisher, this.price, this.category);
}

class Bookstore {
  List<Book> books = [];

  void addBook(Book book) {
    books.add(book);
    print("Buku dengan judul ${book.title} berhasil ditambahkan.");
  }

  List<Book> getAllBooks() {
    return books;
  }

  void removeBook(String id) {
    Book? foundBook;
    for (var book in books) {
      if (book.id == id) {
        foundBook = book;
        break;
      }
    }
    if (foundBook != null) {
      books.remove(foundBook);
      print("Buku dengan judul ${foundBook.title} berhasil dihapus.");
    } else {
      print("Buku dengan ID $id tidak ditemukan.");
    }
  }
}

void main() {
  var bookstore = Bookstore();

  // Menambahkan beberapa buku
  var book1 = Book("001", "Majalah Bobo", "Gramedia", 100000, "Cerita Anak Anak");
  var book2 = Book("002", "Pulang", "Tereliye", 120000, "Novel");
  var book3 = Book("003", "Tomie", "Junji Ito", 90000, "Manga");

  bookstore.addBook(book1);
  bookstore.addBook(book2);
  bookstore.addBook(book3);

  // Mendapatkan semua buku
  var allBooks = bookstore.getAllBooks();
  print("\nDaftar Buku:");
  for (var book in allBooks) {
    print("ID: ${book.id}, Judul: ${book.title}, Penerbit: ${book.publisher}, Harga: ${book.price}, Kategori: ${book.category}");
  }

  // Menghapus sebuah buku
  var bookIdToRemove = "002";
  print("\nMenghapus buku dengan ID: $bookIdToRemove");
  bookstore.removeBook(bookIdToRemove);

  // Mendapatkan semua buku setelah penghapusan
  print("\nDaftar Buku setelah penghapusan:");
  allBooks = bookstore.getAllBooks();
  for (var book in allBooks) {
    print("ID: ${book.id}, Judul: ${book.title}, Penerbit: ${book.publisher}, Harga: ${book.price}, Kategori: ${book.category}");
  }
}
