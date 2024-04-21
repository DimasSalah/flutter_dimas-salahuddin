
import 'dart:convert';

ContactModel contactModelFromMap(String str) => ContactModel.fromMap(json.decode(str));

String contactModelToMap(ContactModel data) => json.encode(data.toMap());

class ContactModel {
    final int? id;
    final String name;
    final String phone;
    final String color;
    final String birthDate;
    final String fileName;

    ContactModel({
        this.id,
        required this.name,
        required this.phone,
        required this.color,
        required this.birthDate,
        required this.fileName,
    });

    factory ContactModel.fromMap(Map<String, dynamic> json) => ContactModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        color: json["color"],
        birthDate: json["birthdate"],
        fileName: json["fileName"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "phone": phone,
        "color": color,
        "birthdate": birthDate,
        "fileName": fileName,
    };
}
