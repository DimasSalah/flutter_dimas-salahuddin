import 'package:prioritas_1/model/contact_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  final databaseName = 'contact.db';
  String contactTable =
    'CREATE TABLE contact (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, phone TEXT, color TEXT, birthdate TEXT DEFAULT CURRENT_TIMESTAMP , fileName TEXT)';
  Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(contactTable);
    });
  }

  //create contact
  Future<int> insertContact(ContactModel) async {
    final Database db = await initDB();
    return db.insert('contact', ContactModel.toMap());
  }

  //get all contacts
  Future<List<ContactModel>> getAllContacts() async {
    final Database db = await initDB();
    final List<Map<String, dynamic>> result = await db.query('contact');
    return result.map((e) => ContactModel.fromMap(e)).toList();
  }

  //delete contact
  Future<int> deleteContact(int id) async {
    final Database db = await initDB();
    return db.delete('contact', where: 'id = ?', whereArgs: [id]);
  }

  //update contact
  Future<int> updateContact(ContactModel contact) async {
    final Database db = await initDB();
    return db.update('contact', contact.toMap(),
        where: 'id = ?', whereArgs: [contact.id]);
  }
}
