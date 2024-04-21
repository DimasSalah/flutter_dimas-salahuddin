import 'package:flutter/material.dart';
import 'package:prioritas_1/pages/contact/components/custom_result_card.dart';
import 'package:prioritas_1/pages/contact/controller/contact_controller.dart';
import 'package:provider/provider.dart';

class ListResult extends StatelessWidget {
  const ListResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactController>(
      builder: (context, value, child) {
        return Expanded(
          child: value.resultContacts.isEmpty
              ? const Center(
                  child: Text(
                    'No Contact Found',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              : ListView.builder(
                  itemCount: value.resultContacts.length,
                  itemBuilder: (context,index) {
                    final contact = value.resultContacts[index];
                    return ResultCard(
                      fullName: contact.name,
                      phoneNumber: contact.phone,
                      birthDate: contact.birthDate,
                      fileName: contact.fileName == 'Open File'
                          ? 'No file selected'
                          : contact.fileName,
                      color: Color(int.parse('0xFF${contact.color}')),
                      onTapEdit: () {
                        
                      },
                      onTapDelete: () {
                        value.deleteContact(index);
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
