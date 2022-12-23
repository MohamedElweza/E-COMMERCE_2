import 'package:T3ala/screens/CartScreen.dart';
import 'package:T3ala/screens/favoriteScreen.dart';
import 'package:T3ala/screens/profileScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Map<String, dynamic>> _pages = [
    {'page':  Home(), 'label': 'Home'},
    {'page':  const Favorite(),'label': 'Favorites'},
    {'page':  const Cart(), 'label': 'Cart'},
    {'page':  Profile(), 'label': 'Profile'},
  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        height: 50,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.favorite, size: 30),
          Icon(Icons.shopping_cart_rounded, size: 30),
          Icon(Icons.person_sharp, size: 30),
        ],
        // color: Colors.white,
        buttonBackgroundColor: Colors.green,
        backgroundColor: Colors.green,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: _onItemTapped,
        letIndexChange: (index) => true,
      ),
      body: _pages[_selectedIndex]['page'],
    );
  }
}
