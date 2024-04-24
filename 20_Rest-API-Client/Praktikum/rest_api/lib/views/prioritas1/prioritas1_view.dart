// main.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/data/api/book_service.dart';
import 'package:rest_api/data/api/contact_service.dart';

import '../../data/model/contact_model.dart';
import 'component/custom_drawer.dart';

class Prioritas1View extends StatefulWidget {
  const Prioritas1View({super.key});

  @override
  _Prioritas1ViewtState createState() => _Prioritas1ViewtState();
}

class _Prioritas1ViewtState extends State<Prioritas1View> {
  ContactModel _contact = ContactModel();
  bool _isLoading = true;
  int _idCounter = 0;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();

  void _incrementId() {
    setState(() {
      _idCounter++;
    });
  }

  Future<void> fetchPersonData() async {
    ContactModel contact = await ContactService.fetchContact();
      setState(() {
        _contact = contact;
        _isLoading = false;
      });
  }

  @override
  void initState() {
    super.initState();
    fetchPersonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Prioritas 1',),
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Prioritas 1.1',style: TextStyle(fontSize: 16)),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone',
              ),
            ),
            ElevatedButton(
              onPressed: ()  {
                ContactService.postContact(
                  _idCounter.toString(),
                  _nameController.text,
                  _phoneController.text,
                );
                _incrementId();
                debugPrint('Submit');
              
              },
              child: const Text('Post Data'),
            ),
            const SizedBox(height: 16),
            _isLoading
                ? const CircularProgressIndicator()
                : _contact.id != null
                    ? ListTile(
                        leading: CircleAvatar(
                          child: Text('${_contact.id}'),
                        ),
                        title: Text('${_contact.name}'),
                        subtitle: Text('${_contact.phone}'),
                        trailing: const Text('Prioritas 1.2', style: TextStyle(fontSize: 16),),
                      )
                    : const Text('gagal memuat data contact'),

            const SizedBox(height: 16),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextFormField(
              controller: _bodyController,
              decoration: const InputDecoration(
                labelText: 'Body',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                BookService.putBook(
                  _idCounter,
                  _idCounter,
                  _titleController.text,
                  _bodyController.text,
                );
                _incrementId();
                debugPrint('Submit');
              },
              child: const Text('Put Data'),
            ),
          ],
        ),
      ),
    );
  }
}

