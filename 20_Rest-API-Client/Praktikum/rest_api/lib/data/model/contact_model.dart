class ContactModel {
   int? id;
   String? name;
   String? phone;

  ContactModel({this.id, this.name, this.phone});

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }
}