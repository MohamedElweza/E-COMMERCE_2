import 'package:T3ala/screens/productsScreen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List categorynum = [
    '4208',
    '4209',
    '4210'
  ];
  List Category_imgs = [
    'assets/images/jj.jpg',
    'assets/images/s.jpg',
    'assets/images/a.jpg'
  ];

  List Offer_imgs = [
    'assets/images/of.jpg',
    'assets/images/off.jpg',
    'assets/images/off1.jpg'
  ];

  List names = [
    'Jeans',
    'Shoes & Boots',
    'Accessories'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.grey[50],
        leading: Icon(Icons.menu , color: Colors.green,),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: const [
                  Text('Find ',
                    style: TextStyle(
                       fontFamily: 'MainFont',
                      color: Colors.redAccent,
                      fontSize: 28,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text('Your',
                    style: TextStyle(
                       fontFamily: 'MainFont',
                      //   color: Colors.redAccent,
                        fontSize: 28,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Text('Desire ',
                    style: TextStyle(
                        fontFamily: 'MainFont',
                        //   color: Colors.redAccent,
                        fontSize: 28,
                        fontWeight: FontWeight.bold
                    ),),
                  Text('Product',
                    style: TextStyle(
                        fontFamily: 'MainFont',
                          color: Colors.greenAccent,
                        fontSize: 28,
                        fontWeight: FontWeight.bold
                    ),),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 25,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: const Icon(Icons.notification_add, color: Colors.deepOrangeAccent,),
            ),
          )
        ],
      ),
      body:
      Column(
        children: [
      Container(
      margin: EdgeInsets.only(top: 15, left: 10, right: 10),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Material(
                  elevation: 5.0,
                  shadowColor: Colors.blue,
                  child: TextField(
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                        ),
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18
                        ),
                        prefixIcon: Container(
                          padding: const EdgeInsets.all(15),
                          width: 18,
                          child: const Icon(Icons.search),
                        )
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only (left: 10),
                  // padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Icon(Icons.manage_search),
                  width: 45,
                height: 55,
              ),
            ],
          )
        ],
      ),
    ),
          const SizedBox(height: 15,),
          CarouselSlider(
              items: Offer_imgs.map((image) {
                return SizedBox(
                  width: double.infinity,
                  child: Image.asset(image, fit: BoxFit.fill,),
                );
              }).toList(),
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: 180,
                initialPage: 0,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 500),
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    decoration: BoxDecoration(  color: Colors.grey[200],borderRadius: BorderRadius.circular(10)),
                    child: const Text('Categories:', style: TextStyle(fontWeight: FontWeight.bold, fontFamily:'Myfont', fontSize: 30 , color: Colors.blue ),)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: categorynum.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                       PageTransition(type: PageTransitionType.fade, child: ProductScreen(C_id: categorynum[index],)),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 130,
                          width: 150,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image(
                                image: AssetImage(
                                  Category_imgs[index].toString(),
                                ),
                              )),
                        ),
                        Text(
                          names[index],
                          maxLines: 1,
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: 'MainFont',
                              // fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

    );
  }
}

