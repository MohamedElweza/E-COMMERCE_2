import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Category.dart';

Future<ProductDetails> getdata(String CategoryId) async{
  http.Response request = await http.get(Uri.https('asos2.p.rapidapi.com','/products/v2/list',
      {
        "store": 'US',
        "offset": '0',
        "categoryId": CategoryId,
        "limit": '48',
        "country": 'US',
        "sort": 'freshness',
        "currency": 'USD',
        "sizeSchema": 'US',
        "lang": 'en-US'
      }),
      headers: {
        'X-RapidAPI-Key': 'c2e37fb2c5msh790db791cdf91e1p170e58jsn7492d3cf5815',
        'X-RapidAPI-Host': 'asos2.p.rapidapi.com'
      });
  if (request.statusCode <= 299 && request.statusCode >= 200) {
    final Map<String, dynamic> jsonBody = json.decode(request.body);
    // List<dynamic> data = jsonBody["products"];
    ProductDetails categoryResponse = ProductDetails.fromMap(jsonBody);
    return categoryResponse;
  }
  else {
    throw ('Request Fail');
  }
}