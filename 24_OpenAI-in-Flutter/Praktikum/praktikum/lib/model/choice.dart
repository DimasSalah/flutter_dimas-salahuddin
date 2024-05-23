
import 'package:praktikum/model/message.dart';

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