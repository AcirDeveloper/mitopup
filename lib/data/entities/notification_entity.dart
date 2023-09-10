class NotificationsEntity {
  final String idNotification;
  final String title;
  final String message;
  final String idUser;
  final bool read;

  NotificationsEntity({
    required this.idNotification,
    required this.title,
    required this.message,
    required this.idUser,
    required this.read,
  });
}
