import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final String fullName;
  final String phoneNumber;
  final String birthDate;
  final String fileName;
  final Color color;
  final void Function()? onTapEdit;
  final void Function()? onTapDelete;
  const ResultCard({super.key,
    required this.fullName,
    required this.phoneNumber,
    required this.birthDate,
    required this.fileName,
    required this.color,
    required this.onTapEdit,
    required this.onTapDelete,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: Text(fullName[0]),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fullName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    birthDate,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: const Text(
                        ' | ',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      )),
                  Text(
                    phoneNumber,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Text(
                fileName,
                style: const TextStyle(
                  fontSize: 14,
                ),
              )
            ],
          ),
          const Spacer(),
          Column(
            children: [
              //edit button
              GestureDetector(
                child: const Icon(Icons.edit),
                onTap: onTapEdit,
              ),
              const SizedBox(
                height: 10,
              ),
              //delete button
              GestureDetector(
                child: const Icon(Icons.delete),
                onTap: onTapDelete
                
              ),
            ],
          ),
        ],
      ),
    );
  }
}
