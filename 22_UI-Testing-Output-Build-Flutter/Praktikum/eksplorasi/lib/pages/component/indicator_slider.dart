import 'package:flutter/material.dart';

class IndicatorSlider extends StatelessWidget {
  const IndicatorSlider({
    super.key,
    required int current,
  }) : _current = current;

  final int _current;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 3; i++)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: _current == i
                  ? Colors.grey
                  : Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
      ],
    );
  }
}
