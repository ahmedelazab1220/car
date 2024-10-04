class ExhibitsEntity {
  int? id;
  String? title;
  num? price;
  num? priceAfterDiscount;
  int? qty;
  String? description;
  List<dynamic>? images;
  ExhibitsEntity({
    this.id,
    this.title,
    this.price,
    this.priceAfterDiscount,
    this.qty,
    this.description,
    this.images,
  });
}
