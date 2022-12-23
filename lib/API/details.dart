import '../models/Category.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/ProductsDetails.dart';

Future<ProDetails> GetProductdata(String ProductId) async{
  http.Response request = await http.get(Uri.https('asos2.p.rapidapi.com','/products/v3/detail',
      {
        'id': ProductId, 'lang': 'en-US', 'store': 'US', 'sizeSchema': 'US', 'currency': 'USD'
      }),
      headers: {
        'X-RapidAPI-Key': 'c2e37fb2c5msh790db791cdf91e1p170e58jsn7492d3cf5815',
        'X-RapidAPI-Host': 'asos2.p.rapidapi.com'
      });
  if (request.statusCode <= 299 && request.statusCode >= 200) {
    final Map<String, dynamic> jsonBody = json.decode(request.body);
    ProDetails detailsResponse = ProDetails.fromMap(jsonBody);
    return detailsResponse;
  }
  else {
   throw ('Request Fail');
  }
}