# Summarry Flutter Navigation
## Apa itu Navigation?
#### Navigation adalah berpindah dari halaman satu ke halaman yang lain
#### Jenis-Jenis Navigation:
- push(): Digunakan untuk menampilkan screen baru di atas screen yang sedang aktif.
- pop(): Digunakan untuk menutup screen yang sedang aktif dan kembali ke screen sebelumnya.
- RemoveUntil(): Digunakan untuk menutup beberapa screen sekaligus dan kembali ke screen tertentu.
- replace(): Digunakan untuk mengganti screen yang sedang aktif dengan screen baru.



#### Navigasi Dasar

Navigator Push digunakan untuk berpindah halaman
```dart
Navigator.of(context).push(MaterialPageRoute(builder: (_) => const HomeScreen));
```
Navigator Pop digunakan untuk kembali ke halaman sebelumnya
```dart
ElevatedButton(
    onPressed: () {
     Navigator.pop(context);
    },
    child: Text('Go Back to Home'),
),
```
#### Navigation dengan NamedRoutes
- Tiap halaman memiliki alamat yang disebut route
- Menambahkan initialRoutes pada main.dart
- Tiap route adalah fungsi untuk membentuk halaman
- menggunakan Navigator.pushNamed()
```dart
intialRoute: '/',
routes: {
    '/' : (_) => const HomeScreen();
    '/about' : (_) => const AboutScreen();
}
```
#### Contoh penggunaan untuk berpindah halaman
```dart
onPressed: () {
    navigator.of(context).pushNamed('/about');
}
```