import 'package:T3ala/models/Products.dart';
import 'package:T3ala/models/ProductsDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../API/API_Response.dart';
import '../models/Category.dart';
import 'CartScreen.dart';
import 'Details.dart';

class ProductScreen extends StatelessWidget {
   const ProductScreen( {Key? key, required this.C_id}) : super(key: key);
   final String C_id;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('Products' , style: TextStyle(fontFamily: 'MainFont', fontSize: 35, color: Colors.redAccent),),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.green, size: 25,), onPressed: () { Navigator.of(context).pop(); },),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Cart()));
          }, icon: const Icon(Icons.shopping_cart_outlined, color: Colors.deepPurple,size: 25,))
        ],
      ),
        body: FutureBuilder<ProductDetails>(
          future: getdata(C_id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // response = snapshot.data!;
              // print(snapshot.data!.products.first.name);
              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (BuildContext context, int index) {
                  Products products = snapshot.data!.products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Details(products)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            height: 130,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child:
                                Image(
                                  image: NetworkImage(
                                    'https://${snapshot.data!.products.elementAt(index).imageUrl}',
                                  ),
                                )),
                          ),
                          Text(
                            snapshot.data!.products.elementAt(index).name,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            if (snapshot.hasError) {
              print(snapshot.error);
              return Container();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
      );
  }
}
