class NotificationEntity {
  String? idE;
  String? titleE;
  String? descriptionE;
  bool? isReadE;
  dynamic readAtE;
  dynamic readAtForHumansE;
  DateTime? createdAtE;
  String? createdAtForHumansE;
  NotificationEntity({
    this.idE,
    this.titleE,
    this.descriptionE,
    this.isReadE,
    required this.readAtE,
    required this.readAtForHumansE,
    this.createdAtE,
    this.createdAtForHumansE,
  });
}

class NotificationGroup {
  final String date;
  final List<NotificationEntity> notifications;

  NotificationGroup({
    required this.date,
    required this.notifications,
  });
}
