class BookModel {
  final int id;
  final int userId;
  final String title;
  final String body;

  BookModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }
}
