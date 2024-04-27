import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../bloc/contact_cubit.dart';

class CustomColorPicker extends StatelessWidget {
  const CustomColorPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorCubit = ColorCubit();
    Color currentColor = colorCubit.state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Color Picker',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return BlocProvider.value(
                  // Menggunakan BlocProvider.value untuk melewatkan instance yang sudah ada
                  value: colorCubit,
                  child: AlertDialog(
                    title: const Text(
                      'Pick a color',
                      style: TextStyle(fontSize: 20),
                    ),
                    content: SizedBox(
                      height: 300,
                      child: ColorPicker(
                        pickerColor: currentColor,
                        onColorChanged: (color) {
                          if (color != currentColor) {
                            colorCubit.changeColor(color);
                          }
                        },
                        pickerAreaHeightPercent: 0.43,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          currentColor = colorCubit.state;
                          
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: BlocBuilder<ColorCubit, Color>(
            bloc: colorCubit,
            builder: (context, state) {
              return Container(
                width: 160,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: state,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.colorize_sharp,
                  size: 20,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
