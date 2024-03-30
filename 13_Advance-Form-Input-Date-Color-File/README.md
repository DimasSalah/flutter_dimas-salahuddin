
# Summarry Advance Form 
## Date Picker
- widget dimana user dapat memasukkan tanggal 
- biasanya digunakan untuk mengisi tgl lahir, pemesanan ticket, dan yang bersangkutan mengenai input tanggal



#### Penggunaan Widget DatePicker

```dart
showDatePicker(
  context: context,
  initialDate: DateTime.now(),
  firstDate: DateTime(2000),
  lastDate: DateTime(2024),
)
```

## Color Picker
- widget dimana user dapat memilih warna
- menambahkan package yang bernama flutter_colorpicker
- Custom widget ada 3 Macam yaitu BlockPicker, ColorPicker, dan SlidePicker

#### Penggunaan Widget DatePicker

```dart
Color _currentColor = Colors.white;

BlockPicker(
  pickerColor: _currentColor,
  onColorChanged: (color) {
    setState(() {
      _currentColor = color;
    });
  },
),
```
## File Picker
- widget dimana user dapat memilih file dengan mengakses storage
- package yang digunakan adalah file_picker 
## Open File
- dapat membuka file didalam storage dengan mengakses path yang didapatkan dari File Picker
- package yang digunakan adalah open_picker 
#### Contoh pembuatan fungsi File Picker dan Open FIle

```dart
Future<String> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return 'no file selected';

    final file = result.files.first;
    openFile(file);
    final String namePath = file.name;
    return namePath; 
  }

  void openFile(PlatformFile file) async {
    OpenFile.open(file.path);
  }
```