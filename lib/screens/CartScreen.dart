import 'package:flutter/material.dart';
import '../local/cart_sqlite/Cart_sql.dart';
import '../local/cart_sqlite/db_helper_Cart.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    int num = 1;
    List<Carts> carts = [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Cart',
          style: TextStyle(
              fontFamily: 'MainFont', fontSize: 35, color: Colors.green),
        ),
      ),
      body: FutureBuilder<List<Carts>>(
        future: CartHelper.instance.getAllCarts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            carts = snapshot.data!;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: carts.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shadowColor: Colors.greenAccent,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 80,
                                width: 70,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    'http://${carts.elementAt(index).image}',
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 200,
                                    child: Text(
                                      carts.elementAt(index).name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    carts.elementAt(index).price,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        fontFamily: 'Myfont'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black12,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: IconButton(
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
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.greenAccent),
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            child: Text(
                                              num.toString(),
                                              style: const TextStyle(
                                                  fontFamily: 'Myfont',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black12,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                num++;
                                              });
                                            },
                                            color: Colors.white,
                                            icon: const Icon(
                                              Icons.add,
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        CartHelper.instance
                                            .deleteCart(carts[index].id!);
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.redAccent,
                                      size: 34,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      backgroundColor: Colors.black,
                    ),
                    child: const Text(
                      'Checkout',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            );
          }
          if (snapshot.hasError) {
            return Container();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
