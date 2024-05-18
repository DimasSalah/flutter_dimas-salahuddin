# MVVM Architecture
Memisahkan logic dengan tampilan (View) ke dalam ViewModel
### Keuntungan
- Reusability, Jika ada beberapa tampilan yang memerlukan alur logic yang sama, mereka bisa menggunakan ViewModel yang sama
- Maintainability, Mudah dirawat karena pekerjaan terkait tampilan tidak tertumpuk bersama logic
- Testability Pengujian menjadi terpisah antara pengujian tampilan dengan pengujian logic sehingga dapat meningkatkan produktivitas pada pengujian
 ### Struktur Direktori
- Model memiliki 2 bagian, yaitu bentuk data yang akan digunakan dan sumber dari data tersebut.
- Tiap screen diletakkan dalam sebuah direktori yang di dalamnya terdapat View dan ViewModel
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