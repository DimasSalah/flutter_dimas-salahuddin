import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/contact_model.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(const ContactState(),) {
    on<GetContact>((event, emit) {
      emit(const ContactState(contacts: [
        ContactModel(
            name: 'Dimas ',
            phoneNumber: '1234567890',
            color: Colors.black,
            birthDate: '09-02-2003',
            fileName: 'test'),
      ]));
    });

    on<AddContact>((event, emit) {
      final List<ContactModel> newContacts = List.from(state.contacts)
        ..add(event.contact);
      emit(state.copyWith(contacts: newContacts));
    });

    on<DeleteContact>((event, emit) {
      final List<ContactModel> newContacts = List.from(state.contacts)
        ..remove(event.contact);
      emit(state.copyWith(contacts: newContacts));
    });
  }
}
