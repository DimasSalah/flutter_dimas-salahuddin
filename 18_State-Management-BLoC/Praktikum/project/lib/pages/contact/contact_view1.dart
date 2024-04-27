import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prioritas_1/model/contact_model.dart';

import '../../bloc/contact_bloc.dart';

class ContactView1 extends StatelessWidget {
  ContactView1({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: Column(
        children: [
          Text('Contact Page'),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
          TextField(
            controller: _phoneController,
            decoration: const InputDecoration(
              labelText: 'Phone',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final contact = ContactModel(
                  name: _nameController.text,
                  phoneNumber: _nameController.text,
                  color: Colors.black,
                  birthDate: '09-02-2003',
                  fileName: 'fileName');

              if (contact.name.isNotEmpty && contact.phoneNumber.isNotEmpty) {
                context.read<ContactBloc>().add(AddContact(contact));
                print('Contact: $contact');
                return;
              }
            },
            child: const Text('Submit'),
          ),
          Expanded(
            child: BlocBuilder<ContactBloc, ContactState>(
              builder: (context, state) {
                if (state.contacts.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                    itemCount: state.contacts.length,
                    itemBuilder: (context, index) {
                      final contact = state.contacts[index];
                      return ListTile(
                        title: Text(contact.name),
                        subtitle: Text(contact.phoneNumber),
                        leading: CircleAvatar(
                          backgroundColor: contact.color,
                          child: Text(contact.name[0]),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            context
                                .read<ContactBloc>()
                                .add(DeleteContact(contact));
                          },
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
