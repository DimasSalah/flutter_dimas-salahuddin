
# Summarry Assets
## Assets
- File yang di bundle dan dideployed bersama dengan aplikasi
- tipe tipe assets: JSON, icons, image, dan font



#### Penambahan Assets
cara penggunaanya dengan cara pergi ke pubspec.yaml yang terletak pada root project dan menambahkan kode dibawah
```dart
aseets:
    - aseets/images/
    - aseets/icons/
    - assets/font/
```

## Image
- Flutter mendukung format gambar seperti JPEG, WebP, GIF,PNG, BMP, dan WBMP
- menampilkan gambar dari dalam project assets dan internet

#### Penggunaan Widget DatePicker

```dart
//image dari assets project
Image.asset('assets/iamges/background.jpg') 
//image dari internet
Image.network('https://unsplash/1/4387sd09asdhjsf')
```
## Vector
- mendukung grafik vector skalabel
- membuat SVG dari assets atau internet
- membutuhkan package flutter_svg

#### Contoh penerapan vector

```dart
SvgPicture.asset(
  'assets/icons/car.svg')
```