
# Summarry Provider
## Class pada penggunaan Provider :
### ChangeNotifierProvider
- Mengimplementasikan ChangeNotifier dan menggunakan child untuk widger Ui
- Menggunakan create, provider yang akan menyimpan model yang telah dibuat
```dart
ChangeNotifierProvider(
    create : (context) => contactController(),
    child: <widget>,
);
```



### MultiProvider
- jika kita membutuhkan lebih dari satu provider
```dart
MultiProvider(
      providers: [
        provider<MyModel>(create: (_) => contactController()),
        provider<MyDatabase>(create: (_) => moreContactController()),
      ],
      child: <widget> 
);
```
### Consumer
- widget yang mendengarkan perubahan kelas yang mengimplementasikan ChangeNotifier
- Membangun ulang widget yang dibungkus Consumer saja
- Penting untuk meletakan Consumer pada lingkup sekecil mungkin
- membutuhkan properti builder yang berisi context, model, dan child
```dart
Consumer<MyModel>(
    builder: (context, model, child) {
        return Text('Hello ${model.value}');
    }
);
```
### ChangeNotifier
- Class yang menambah dan menghapus listeners
- Digunakan dengan cara meng-extends
- memanggil notifyListener(), fungsi yang memberitahu widget yang menggunakan state bahwa terjadi peubahan data sehingga UI nya harus dibangun ulang
```dart
import 'package:flutter/foundation.dart'

class ContactController extends ChangeNotifier {

}
```

