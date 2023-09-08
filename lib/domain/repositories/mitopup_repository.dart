import 'package:mitopup/domain/entities/entities.dart';

// contacts
abstract class ContactsRepository {
  Future<List<ContactEntity>> getContacts();

  Future<void> cacheContacts(List<ContactEntity> contacts);
}

// country
abstract class CountryRepository {
  Future<List<CountryEntity>> getCountries();

  Future<void> cacheCountries(List<CountryEntity> countries);
}

// recharges
abstract class RechargesRepository {
  Future<List<RechargesEntity>> getRecharges();

  Future<void> cacheRecharges(List<RechargesEntity> recharges);
}

// promos
abstract class PromosRepository {
  Future<List<PromosEntity>> getPromos();

  Future<void> cachePromos(List<PromosEntity> promos);
}

// Notifications
abstract class NotificationsRepository {
  Future<List<NotificationsEntity>> getNotifications();

  Future<void> cacheNotifications(List<NotificationsEntity> notifications);
}
