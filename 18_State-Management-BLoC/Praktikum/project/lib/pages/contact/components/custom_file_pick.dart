import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prioritas_1/bloc/contact_cubit.dart';

import '../controller/contact_controller.dart';

class CustomFilePicker extends StatelessWidget {
  const CustomFilePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fileNameCubit = FileNameCubit();
    String fileName = fileNameCubit.state;
    return GestureDetector(
      onTap: () async {
        final fileNamePath = await ContactController().pickFile();
        if (fileNamePath != 'kosong') {
          fileNameCubit.updateFileName(fileNamePath);
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(36),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 5,
            ),
            BlocBuilder<FileNameCubit, String>(
              bloc: fileNameCubit,
              builder: (context, state) {
                return Text(
                  state,
                  style: const TextStyle(color: Colors.black),
                );
              },
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.file_present,
              size: 20,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
