class Message {
  Message({
    required this.role,
    required this.content,
  });

  String? role;
  String? content;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        role: json["role"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "content": content,
      };
}