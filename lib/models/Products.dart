import 'package:T3ala/models/currentprice.dart';

class Products{
  late int id;
  late String name;
  late PriceList price;
  late String imageUrl;
  late String colour;
  late String url;
  late String brandName;
  late int productCode;

  Products({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.colour,
    required this.url,
    required this.brandName,
    required this.productCode,
});
  Products.fromMap(Map<String, dynamic> map) {
    this.id = map['id'] ;
    this.name = map['name'] ;
    this.colour = map['colour'] ;
    this.brandName = map['brandName'] ;
    this.url = map['url'] ;
    this.productCode = map['productCode'] ;
    price =PriceList.fromMap(map["price"]);
    this.imageUrl = map['imageUrl'] ;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'price': this.price.toMap(),
      'id': this.id,
      'name': this.name,
      'imageUrl': this.imageUrl,
      'colour': this.colour,
      'brandName': this.brandName,
      'url': this.url,
      'productCode': this.productCode,
    };
    return map;
  }
}