# Summarry Assets
### Deskripsi
- File yang di bundled dan di deployed bersamaan dengan aplikasi
- Tipe-tipe assets, seperti: static data (JSON files), icons, images, dan font file (ttf/otf)
- cara menambahkan assets dapat melalui pubspec.yaml 
contoh :
```dart
assets:
- assets/images/
- assets/icons/
```
### Image
- Image atau gambar akan membuat tampilan aplikasi menjadi lebih menarik
- Flutter mendukung format gambar seperti JPEG, WebP, GIF,Animated Web/GlF, PNG, BMP, dan WBMP.
- Menampilkan gambar dari project asset dan internet
contoh :
```dart
Image(
    image: Assetlmage('assets/images/background.jpg'),
)
```
### Vector
- Membutuhkan package flutter_svg.
- Mendukung grafik vektor skalabel.
- Memuat SVG dari assets atau jaringan.
```dart
dependencies:
 flutter_svg: 2.0.9
```
contoh :
```dart
SvgPicture.Assets('assets/icon/home.svg')
```
### Font
- Penggunaan font dengan style tertentu akan menjadi keunikan pada aplikasi
- Penentuan font yang mau dipakai biasa nya Oleh Ul designer
- Penerapan font menggunakan custom font atau dari package

contoh custom Font :
- import font berformat ttf/otf lalu
- daftarkan pada pubspec.yaml

```dart
fonts :
  - family: Rowdies
    fonts :
      - asset: fonts/Rowdies-Bold.ttf
      - asset: fonts/Rowdies-Light.ttf
      - asset: fonts/Rowdies-Regular.ttf

```
