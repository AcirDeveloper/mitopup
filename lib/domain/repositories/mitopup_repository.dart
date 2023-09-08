import 'package:mitopup/domain/entities/contact_entity.dart';

abstract class ContactsDataSource {
  Future<List<ContactEntity>> getContacts();

  Future<void> cacheContacts(List<ContactEntity> contacts);
}
