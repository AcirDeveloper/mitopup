import 'package:mitopup/domain/entities/entities.dart';

// contacts

abstract class ContactsDataSource {
  Future<List<ContactEntity>> getContacts();

  Future<void> cacheContacts(List<ContactEntity> contacts);
}

// country
abstract class CountryDataSource {
  Future<List<CountryEntity>> getCountries();

  Future<void> cacheCountries(List<CountryEntity> countries);
}

// recharges
abstract class RechargesDataSource {
  Future<List<RechargesEntity>> getRecharges();

  Future<void> cacheRecharges(List<RechargesEntity> recharges);
}

// promos
abstract class PromosDataSource {
  Future<List<PromosEntity>> getPromos();

  Future<void> cachePromos(List<PromosEntity> promos);
}

// Notifications
abstract class NotificationsDataSource {
  Future<List<NotificationsEntity>> getNotifications();

  Future<void> cacheNotifications(List<NotificationsEntity> notifications);
}
