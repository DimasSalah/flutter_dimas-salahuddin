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