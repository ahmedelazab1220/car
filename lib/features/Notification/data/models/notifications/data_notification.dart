import 'package:car_help/features/Notification/domain/entites/notification_entity.dart';

class DataNotifications extends NotificationEntity {
  String? id;
  String? title;
  String? description;
  bool? isRead;
  dynamic readAt;
  dynamic readAtForHumans;
  DateTime? createdAt;
  String? createdAtForHumans;

  DataNotifications({
    this.id,
    this.title,
    this.description,
    this.isRead,
    this.readAt,
    this.readAtForHumans,
    this.createdAt,
    this.createdAtForHumans,
  }) : super(
            idE: id,
            titleE: title,
            descriptionE: description,
            isReadE: isRead,
            readAtE: readAt,
            readAtForHumansE: readAtForHumans,
            createdAtE: createdAt,
            createdAtForHumansE: createdAtForHumans);

  factory DataNotifications.fromJson(Map<String, dynamic> json) =>
      DataNotifications(
        id: json['id'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        isRead: json['is_read'] as bool?,
        readAt: json['read_at'] as dynamic,
        readAtForHumans: json['read_at_for_humans'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        createdAtForHumans: json['created_at_for_humans'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'is_read': isRead,
        'read_at': readAt,
        'read_at_for_humans': readAtForHumans,
        'created_at': createdAt?.toIso8601String(),
        'created_at_for_humans': createdAtForHumans,
      };
}
