class MyServicesEntity {
  int? id;
  String? title;
  int? price;
  num? priceAfterDiscount;
  int? qty;
  String? description;
  List<String>? images;
  MyServicesEntity({
    this.id,
    this.title,
    this.price,
    this.priceAfterDiscount,
    this.qty,
    this.description,
    this.images,
  });
}
