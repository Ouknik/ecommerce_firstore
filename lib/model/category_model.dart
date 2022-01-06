class CategoryModel {
  late String name, image;
  CategoryModel({required this.image, required this.name});
  CategoryModel.fromjson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name']!;
    image = map['image'];
  }
  toJson() {
    return {'name': name, 'image': image};
  }
}
