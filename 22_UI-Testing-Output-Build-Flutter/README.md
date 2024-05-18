# UI Testing
Pengujian yang dilakukan pada tampilan suatu aplikasi untuk
memastikan aplikasi dapat menerima interaksi dan memberi
respon kepada pengguna.
Disebut juga widget testing sehingga pengujian dilakukan pada
widgets dengan menuliskan script yang dapat dijalankan secara
otomatis.

### Keuntungan
- Memastikan seluruh widget memberi tampilan yang sesuai
- Memastikan seluruh interaksi dapat diterima dengan baik
- Menjadi ketentuan yang harus diikuti saat diperlukan perubahan pada widget

 ### Penulisan Script Testing
 - Dilakukan pada folder test
 - Nama file harus diikuti -test.dart, contoh contact-test.dart
 - Tiap file berisi fungsi main() yang di dalamnya dapat dituliskan script testing
 - Tiap skenario pengujian disebut test case

#### Model
- Bentuk data yang akan digunakan, dibuat dalam bentuk class
- Data-data yang dimuat, diletakkan pada property

#### View Model 
- Menyimpan data-data danlogic yang diperlukan halaman ContactScreen
- Jika widget lain memerlukan logic yang sama, dapat menggunakan ViewModel ini juga

#### View
- menggunakan StatefullWidget
cara menampilkan data di view yaitu;
- letakkan pada bagian build
- Menggunakan getters yang ada pada ViewModel
- Data dapat langsung ditampilkan pada widgets
```dart
void main() {
  testWidgets('Contact View Test', (WidgetTester tester) async {
    await tester.pumpWidget( MaterialApp(home: GalleryView()));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('appbar')), findsOneWidget);
    expect(find.byKey(const Key('appbarTitle')),  findsOneWidget);
    expect(find.byKey(const Key('GridView')), findsOneWidget);
  });
}
```


