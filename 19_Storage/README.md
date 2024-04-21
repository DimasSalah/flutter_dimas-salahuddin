# Summarry Storage
### Local Storage
Diperlukan untuk efisiensi penggunaan data internet
Ada beberapa cara implementasi penyimpanan lokal, contoh nya
seperti:
- Shared Preferences
- Local Database
### Shared Preferences
- Menyimpan data yang sederhana
- Penyimpanan dengan format key-value
- Menyimpan tipe data dasar seperti teks, angka, dan boolean.
- Contoh penggunaan shared preference seperti menyimpan data
- login dan menyimpan riwayat pencarian
contoh untuk write data :
```dart
final SharedPreferences prefs = await SharedPreferences.getInstance();
await prefs.setInt('counter', 10);
```
contoh untuk read data :
```dart
final SharedPreferences prefs = await SharedPreferences.getInstance();
final int? counter = prefs.getInt('counter')
```
### Local Database (SQLite)
- Menyimpan dan meminta data dalam jumlah besar pada local device
- Bersifat privat
- Menggunakan SQLite database melalui package sqflite
- SQLite adalah database open source yang mendukung insert, read,update dan remove data.
Demo code untuk menunjukan Raw SQL queries :
```dart
// Get a location using getDatabasesPath
var databasesPath = await getDatabasesPath();
String path = join(databasesPath, 'demo.db');

// Delete the database
await deleteDatabase(path);

// open the database
Database database = await openDatabase(path, version: 1,
    onCreate: (Database db, int version) async {
  // When creating the db, create the table
  await db.execute(
      'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
});

// Insert some records in a transaction
await database.transaction((txn) async {
  int id1 = await txn.rawInsert(
      'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
  print('inserted1: $id1');
  int id2 = await txn.rawInsert(
      'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
      ['another name', 12345678, 3.1416]);
  print('inserted2: $id2');
});

// Update some record
int count = await database.rawUpdate(
    'UPDATE Test SET name = ?, value = ? WHERE name = ?',
    ['updated name', '9876', 'some name']);
print('updated: $count');

// Get the records
List<Map> list = await database.rawQuery('SELECT * FROM Test');
List<Map> expectedList = [
  {'name': 'updated name', 'id': 1, 'value': 9876, 'num': 456.789},
  {'name': 'another name', 'id': 2, 'value': 12345678, 'num': 3.1416}
];
print(list);
print(expectedList);
assert(const DeepCollectionEquality().equals(list, expectedList));

// Count the records
count = Sqflite
    .firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM Test'));
assert(count == 2);

// Delete a record
count = await database
    .rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
assert(count == 1);

// Close the database
await database.close();
```
