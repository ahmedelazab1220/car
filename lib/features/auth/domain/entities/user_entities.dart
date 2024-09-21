class UserEntity {
  int? id;
  String? userType;
  String? name;
  String? phone;
  String? profileImage;
  String? status;
  String? defaultLang;
  int? enableNotification;
  int? enableAdvertisementNotification;

  UserEntity({
    this.id,
    this.userType,
    this.name,
    this.phone,
    this.profileImage,
    this.status,
    this.defaultLang,
    this.enableNotification,
    this.enableAdvertisementNotification,
  });
}
