import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:prioritas_1/screens/contact/components/drawer_sidebar.dart';
import 'package:prioritas_1/screens/contact/contact_view_model.dart';
import 'package:prioritas_1/screens/contact/components/custom_color_pick.dart';
import 'package:prioritas_1/screens/contact/components/custom_file_pick.dart';
import 'package:prioritas_1/screens/contact/components/custom_result_card.dart';
import 'package:prioritas_1/screens/contact/components/date_form.dart';
import 'package:prioritas_1/screens/contact/components/header_title.dart';
import 'package:provider/provider.dart';

import 'components/custom_form.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ContactController>(context, listen: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 20,
      ),
      drawer: const DrawerSideBar(),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HeaderTitle(),
              //form Full Name
              CustomForm(
                nameController: controller.nameController,
                title: 'Full Name',
                inputType: TextInputType.text,
                validatorInput: ContactController.nameValidator,
              ),
              const SizedBox(
                height: 10,
              ),
              //Form Phone Number
              CustomForm(
                nameController: controller.phoneController,
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
                    dueDate: controller.dueDate,
                    onTap: () async {
                      final selectDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      if (selectDate != null) {
                        controller.setDueDate(selectDate);
                      }
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomColorPicker(
                    // Form Color Picker
                    currentColor: controller.currentColor,
                    child: ColorPicker(
                      pickerColor: controller.currentColor,
                      onColorChanged: (color) {
                        controller.setColor(color);
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
                fileName: controller.fileName,
                onTap: controller.onTapFilePicker,
              ),
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
                    controller.submitContact();
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
                child: controller.resultContacts.isEmpty
                    ? const Center(
                        child: Text('No data available'),
                      )
                    : ListView.builder(
                        itemCount: controller.resultContacts.length,
                        itemBuilder: (BuildContext context, int index) {
                          final contact = controller.resultContacts[index];
                          return ResultCard(
                            fullName: contact.name,
                            phoneNumber: contact.phoneNumber,
                            birthDate: DateFormat('dd MMMM yyyy')
                                .format(contact.birthDate),
                            fileName: contact.fileName == 'Open File'
                                ? 'No file selected'
                                : contact.fileName,
                            color: contact.color,
                            onTapEdit: () {
                              controller.editContact(index);
                            },
                            onTapDelete: () {
                              controller.removeContact(index);
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
