# Open Ai
- Sebuah library yang dapat digunakan untuk memanfaatkan teknologi AI (Artificial Intelligence) dan disediakan Oleh OpenAl.
- Library ini nantinya dapat diintegrasikan dengan berbagai aplikasi seperti API, web dan mobile.
### Cara mendapatkan API Key OpenAI
- pertama harus pergi ke halaman berikut [![OpenAI](https://img.shields.io/badge/Open_AI-000?style=logoColor=white)](https://platform.openai.com/api-keys)

- selakanjutnya buat key api baru pada halaman tersebut

 ### Membuat Model untuk menangkap response
 - OpenAi.dart
 ```dart

GptData gptDataFromJson(String str) => GptData.fromJson(json.decode(str));

String gptDataToJson(GptData data) => json.encode(data.toJson());

class GptData {
  GptData({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  String? id;
  String? object;
  int? created;
  String? model;
  List<Choice?> choices;
  Usage? usage;

  factory GptData.fromJson(Map<String, dynamic> json) => GptData(
        id: json["id"],
        object: json["object"],
        created: json["created"],
        model: json["model"],
        choices: List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
        usage: Usage.fromJson(json["usage"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "created": created,
        "model": model,
        "choices": List<dynamic>.from(choices.map((x) => x!.toJson())),
        "usage": usage!.toJson(),
      };
}
```

- Choice.dart
 ```dart
class Choice {
  Choice({
    required this.index,
    this.logprobs,
    required this.finishReason,
    required this.message,
  });

  String? text;
  int? index;
  dynamic logprobs;
  String? finishReason;
  Message? message;

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        index: json["index"],
        logprobs: json["logprobs"],
        finishReason: json["finish_reason"],
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "logprobs": logprobs,
        "finish_reason": finishReason,
        "message": message!.toJson(),
      };
}
 ```

- message.dart
 ```dart
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
  ```


  - usage.dart
   ```dart
class Usage {
  Usage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  int? promptTokens;
  int? completionTokens;
  int? totalTokens;

  factory Usage.fromJson(Map<String, dynamic> json) => Usage(
        promptTokens: json["prompt_tokens"],
        completionTokens: json["completion_tokens"],
        totalTokens: json["total_tokens"],
      );

  Map<String, dynamic> toJson() => {
        "prompt_tokens": promptTokens,
        "completion_tokens": completionTokens,
        "total_tokens": totalTokens,
      };
}
```