// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  var id;
  var price;
  var oldrice;
  var discount;
  String? image;
  String? name;
  String? description;
  ProductModel({
    this.id,
    this.price,
    this.oldrice,
    this.discount,
    this.image,
    this.name,
    this.description,
  });

  ProductModel.fromjson(dynamic json) {
    id = json['id'];
    price = json['price'];
    oldrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    image = json['image'];
  }
}
