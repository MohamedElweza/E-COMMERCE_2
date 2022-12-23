import 'package:T3ala/local/fav_sqlite/Fav_sql.dart';
import 'package:T3ala/local/fav_sqlite/dbHelper_Fav.dart';
import 'package:T3ala/screens/CartScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool toggle = true;
  @override
  Widget build(BuildContext context) {
    List<Fav> favorites = [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Favourites',
          style: TextStyle(
              fontFamily: 'MainFont', fontSize: 35, color: Colors.green),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade, child: Cart()));
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.deepPurple,
                size: 25,
              )),
        ],
      ),
      body: FutureBuilder<List<Fav>>(
          future: FavProvider.instance.getAllFav(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              favorites = snapshot.data!;
              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: favorites.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image(
                                    image: NetworkImage(
                                      'http://${favorites.elementAt(index).image}',
                                    ),
                                  )),
                            ),
                            Text(
                              favorites.elementAt(index).name,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 15,
                        right: 20,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              toggle = !toggle;
                              if (toggle == false) {
                                FavProvider.instance
                                    .deleteFev(favorites[index].id!);
                              }
                            });
                          },
                          icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                        ),
                      )
                    ],
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
