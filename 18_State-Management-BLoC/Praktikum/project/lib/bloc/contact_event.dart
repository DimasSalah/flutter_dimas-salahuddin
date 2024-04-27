part of 'contact_bloc.dart';

sealed class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class GetContact extends ContactEvent {}

class AddContact extends ContactEvent {
  final ContactModel contact;

  const AddContact(this.contact);

  @override
  List<Object> get props => [contact];
}

class DeleteContact extends ContactEvent {
  final ContactModel contact;

  const DeleteContact(this.contact);

  @override
  List<Object> get props => [contact];
}


