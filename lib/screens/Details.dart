import 'package:T3ala/local/fav_sqlite/Fav_sql.dart';
import 'package:T3ala/local/fav_sqlite/dbHelper_Fav.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../local/cart_sqlite/Cart_sql.dart';
import '../local/cart_sqlite/db_helper_Cart.dart';
import '../models/Products.dart';
import 'CartScreen.dart';

class Details extends StatefulWidget {
  Details(this.data, {Key? key}) : super(key: key);
  Products data;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late int id;
  bool toggle = false;
  int num = 1;

  @override
  void initState() {
    super.initState();
    id = widget.data.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Details',
            style: TextStyle(
                fontFamily: 'MainFont', fontSize: 35, color: Colors.green),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade, child: const Cart()));
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.deepPurple,
                  size: 25,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: NetworkImage('http://${widget.data.imageUrl}'),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.data.name,
                        maxLines: 2,
                        style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          toggle = !toggle;
                          if (toggle == false) {
                            FavProvider.instance.deleteFev(widget.data.id);
                          } else {
                            FavProvider.instance.insertFev(
                              Fav(
                                name: widget.data.name,
                                image: widget.data.imageUrl,
                                price: widget.data.price.current.text,
                              ),
                            );
                          }
                        });
                      },
                      icon: toggle
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(Icons.favorite_border,
                              color: Colors.red),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${widget.data.price.current.value} ${widget.data.price.currency}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Myfont',
                        color: Colors.redAccent,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                num == 1 ? num = 1 : num--;
                              });
                            },
                            color: Colors.white,
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.grey,
                              size: 25,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 25,
                              width: 19,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.redAccent),
                                  shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 3.0),
                                child: Text(
                                  num.toString(),
                                  style: const TextStyle(
                                      fontFamily: 'Myfont',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                num++;
                                // widget.data.price.current.value +=
                                //     widget.data.price.current.value;
                              });
                            },
                            color: Colors.white,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      "Color: ",
                      style: TextStyle(
                          fontFamily: 'Myfont', fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      widget.data!.colour,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      "Brand name: ",
                      style: TextStyle(
                        fontFamily: 'Myfont',
                        fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),
                    ),
                    Text(
                      widget.data!.brandName,
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      "productCode: ",
                      style: TextStyle(
                          fontFamily: 'Myfont', fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      widget.data!.productCode.toString(),
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                children: [
                  const Text(
                    "For more Details Check this link:",
                    style: TextStyle(
                        fontFamily: 'Myfont',
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'http://${widget.data!.url}',
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        CartHelper.instance.insertCart(
                          Carts(
                            image: widget.data.imageUrl,
                            price: widget.data.price.current.text,
                            name: widget.data.name,
                          ),
                        );
                      });
                    },
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontFamily: 'Myfont',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Myfont',
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
