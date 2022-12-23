import 'db_helper_Cart.dart';

class Carts {
  int? id;
  late String image;
  late String name;
  dynamic price;


  Carts({
    this.id,
    required this.image,
    required this.price,
    required this.name,
  });

  Carts.fromMap(Map<String, dynamic> map) {
    if (map[columnId] != null) id = map[columnId];
    image = map[columnImage];
    price = map[columnPrice];
    name = map[columnName];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (id != null) map[columnId] = id;
    map[columnImage]  = image;
    map[columnPrice] = price;
    map[columnName] = name;
    return map;
  }
}
