import 'package:T3ala/models/textprice.dart';

class PriceList{
  late TextPrice current;
  late String currency;

  PriceList({required this.current , required this.currency});

  PriceList.fromMap(Map<String, dynamic> map){
    current =TextPrice.fromMap(map['current']);
    this.currency = map['currency'];
  }

  Map<String , dynamic> toMap(){
    Map<String,dynamic> map={
      'current': this.current.toMap(),
      "currency" : this.currency,
    };
    return map;
  }
}