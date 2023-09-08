import 'package:mitopup/domain/entities/entities.dart';

// contacts

abstract class ContactsDataSource {
  Future<List<ContactEntity>> getContacts();
}

// country
abstract class CountryDataSource {
  Future<List<CountryEntity>> getCountries();
}

// recharges
abstract class RechargesDataSource {
  Future<List<RechargesEntity>> getRecharges();
}

// promos
abstract class PromosDataSource {
  Future<List<PromosEntity>> getPromos();
}

// Notifications
abstract class NotificationsDataSource {
  Future<List<NotificationsEntity>> getNotifications();
}
