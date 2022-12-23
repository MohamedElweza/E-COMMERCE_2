import 'package:T3ala/models/Products.dart';

class ProductDetails{
  late String categoryName;
  late List<Products> products;

  ProductDetails({
    required this.categoryName,
    required this.products,
  });

  ProductDetails.fromMap(Map<String, dynamic> map) {

    this.categoryName = map['categoryName'] as String;

    this.products =[];
    (map['products'] as List).forEach((element) {
      this.products.add(Products.fromMap(element));
    });

  }

  Map<String,dynamic> toMap(){

    List productlist =[];
    this.products.forEach((element) {
      productlist.add(element.toMap());
    });

    Map<String,dynamic> map={
      "categoryName" : this.categoryName,
    };
    return map;
  }


}