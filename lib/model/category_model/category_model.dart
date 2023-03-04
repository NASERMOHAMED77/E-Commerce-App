// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  var id;
  String? name;
  String? image;
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });
  CategoryModel.fromjson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
