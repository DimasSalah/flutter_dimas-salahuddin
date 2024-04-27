// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../bloc/contact_cubit.dart';

class DateForm extends StatelessWidget {
  const DateForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dateFormCubit = DateFormCubit();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            text: 'Date of Birth',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: ' *',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              BlocBuilder<DateFormCubit, DateTime>(
                bloc: BlocProvider.of<DateFormCubit>(context),
                builder: (context, state) {
                  return Text(
                    DateFormat('dd/MM/yyyy').format(state),
                    style: const TextStyle(color: Colors.black),
                  );
                },
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () async {
                  final selectDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );
                  if (selectDate != null) {
                    BlocProvider.of<DateFormCubit>(context)
                        .updateDueDate(selectDate);
                  }
                },
                child: const Icon(
                  Icons.calendar_today,
                  size: 20,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
