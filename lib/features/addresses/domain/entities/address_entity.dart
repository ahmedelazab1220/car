class AddressEntity {
  int? id;
  String? ownerName;
  String? ownerPhone;
  String? address;
  String? lat;
  String? lng;
  int? isDefault;
  AddressEntity({
    this.id,
    this.ownerName,
    this.ownerPhone,
    this.address,
    this.lat,
    this.lng,
    this.isDefault,
  });
}
