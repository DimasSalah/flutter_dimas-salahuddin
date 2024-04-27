import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:prioritas_1/bloc/contact_bloc.dart';
import 'package:prioritas_1/bloc/contact_cubit.dart';
import 'package:prioritas_1/model/contact_model.dart';
import 'package:prioritas_1/pages/contact/components/drawer_sidebar.dart';
import 'package:prioritas_1/pages/contact/controller/contact_controller.dart';
import 'package:prioritas_1/pages/contact/components/custom_color_pick.dart';
import 'package:prioritas_1/pages/contact/components/custom_file_pick.dart';
import 'package:prioritas_1/pages/contact/components/custom_result_card.dart';
import 'package:prioritas_1/pages/contact/components/date_form.dart';
import 'package:prioritas_1/pages/contact/components/header_title.dart';

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
  final List<ContactModel> ressultContacts = [];
  
  

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
              const Row(
                children: [
                  DateForm(),
                  SizedBox(
                    width: 10,
                  ),
                  CustomColorPicker()
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomFilePicker(),
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
                    final contact = ContactModel(
                      name: nameController.text,
                      phoneNumber: phoneController.text,
                      color: context.read<ColorCubit>().state,
                      birthDate: DateFormat('dd/MM/yyyy').format(context.read<DateFormCubit>().state),
                      fileName: context.read<FileNameCubit>().state,
                    );
                    if (formKey.currentState!.validate()) {
                      context.read<ContactBloc>().add(AddContact(contact));
                      nameController.clear();
                      phoneController.clear();
                      context.read<ColorCubit>().changeColor(Colors.white);
                      context.read<DateFormCubit>().updateDueDate(DateTime.now());
                      context.read<FileNameCubit>().updateFileName('Open File');
                      return;
                    }
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
                          return ResultCard(
                            fullName: contact.name,
                            phoneNumber: contact.phoneNumber,
                            birthDate: contact.birthDate,
                            fileName: contact.fileName == 'Open File'
                                ? 'No file selected'
                                : contact.fileName,
                            color: contact.color,
                            onTapEdit: () {
                              nameController.text = contact.name;
                              phoneController.text = contact.phoneNumber;
                              context.read<ColorCubit>().changeColor(contact.color);
                              context.read<DateFormCubit>().updateDueDate(DateTime.parse(contact.birthDate));
                              context.read<FileNameCubit>().updateFileName(contact.fileName);
                              context.read<ContactBloc>().add(DeleteContact(contact));
                            },
                            onTapDelete: () {
                              context
                                  .read<ContactBloc>()
                                  .add(DeleteContact(contact));
                            },
                          );
                        });
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

