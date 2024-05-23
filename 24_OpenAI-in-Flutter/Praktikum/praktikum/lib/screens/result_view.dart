import 'package:flutter/material.dart';

import '../model/open_ai.dart';

class ResultScreen extends StatelessWidget {
  final GptData gptResponseData;

  const ResultScreen({super.key, required this.gptResponseData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendations'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Recommendations",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              gptResponseData.choices[0]!.message!.content!,
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}