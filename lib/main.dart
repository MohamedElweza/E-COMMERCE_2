import 'package:T3ala/local/fav_sqlite/dbHelper_Fav.dart';
import 'package:T3ala/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'local/cart_sqlite/db_helper_Cart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CartHelper.instance.open();
  await FavProvider.instance.open();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const SplashScreen(),
    );
  }
}

