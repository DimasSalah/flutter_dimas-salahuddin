import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:prioritas_1/pages/contact/components/drawer_sidebar.dart';
import 'package:prioritas_1/pages/contact/controller/contact_controller.dart';
import 'package:prioritas_1/pages/contact/components/custom_color_pick.dart';
import 'package:prioritas_1/pages/contact/components/custom_file_pick.dart';
import 'package:prioritas_1/pages/contact/components/custom_result_card.dart';
import 'package:prioritas_1/pages/contact/components/date_form.dart';
import 'package:prioritas_1/pages/contact/components/header_title.dart';
import 'package:prioritas_1/model/contact_class.dart';

import 'components/custom_form.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final List<Contact> ressultContacts = [];
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = Colors.white;
  String fileName = 'Open File';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 20,
      ),
      drawer: const DrawerSideBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HeaderTitle(),
              //form Full Name
              CustomForm(
                nameController: nameController,
                title: 'Full Name',
                inputType: TextInputType.text,
                validatorInput: ContactController.nameValidator,
              ),
              const SizedBox(
                height: 10,
              ),
              //Form Phone Number
              CustomForm(
                nameController: phoneController,
                title: 'Phone Number',
                inputType: TextInputType.phone,
                validatorInput: ContactController.validatePhone,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  DateForm(
                    // Form Date of Birth
                    dueDate: _dueDate,
                    onTap: () async {
                      final selectDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      setState(
                        () {
                          if (selectDate != null) {
                            _dueDate = selectDate;
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomColorPicker(
                    // Form Color Picker
                    currentColor: _currentColor,
                    child: ColorPicker(
                      pickerColor: _currentColor,
                      onColorChanged: (color) {
                        setState(() {
                          _currentColor = color;
                        });
                      },
                      pickerAreaHeightPercent: 0.43,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFilePicker(
                  // Form File Picker
                  fileName: fileName,
                  onTap: () async {
                    final fileNamePath = await ContactController().pickFile();
                    if (fileNamePath != 'kosong') {
                      setState(() {
                        fileName = fileNamePath; // Update nilai variabel state
                      });
                    }
                  }),
              const SizedBox(
                height: 18,
              ),
              //submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        ressultContacts.add(Contact(
                          name: nameController.text,
                          phoneNumber: phoneController.text,
                          color: _currentColor,
                          birthDate: DateFormat('dd/MM/yyyy').format(_dueDate),
                          fileName: fileName,
                        ));
                        debugPrint('nama : ${nameController.text}');
                        debugPrint('phone : ${phoneController.text}');
                        debugPrint('color : $_currentColor');
                        debugPrint('date : $_dueDate');
                        debugPrint('file : $fileName');
                        fileName = 'Open File';
                        nameController.clear();
                        phoneController.clear();
                        
                      });
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text('Please complete the form'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text('Submit',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'List Contacts',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ressultContacts.isEmpty
                    ? const Center(
                        child: Text('No data available'),
                      )
                    : ListView.builder(
                        itemCount: ressultContacts.length,
                        itemBuilder: (BuildContext context, int index) {
                          final contact = ressultContacts[index];
                          return ResultCard(
                            fullName: contact.name,
                            phoneNumber: contact.phoneNumber,
                            birthDate: contact.birthDate,
                            fileName: contact.fileName == 'Open File'
                                ? 'No file selected'
                                : contact.fileName,
                            color: contact.color,
                            onTapEdit: () {
                              setState(() {
                                nameController.text = contact.name;
                                phoneController.text = contact.phoneNumber;
                                ressultContacts.removeAt(index);
                              });
                            },
                            onTapDelete: () {
                              setState(() {
                                ressultContacts.removeAt(index);
                              });
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

