import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: Image.asset('assets/images/aaa.png', fit: BoxFit.cover)),
          SizedBox(height: 20,),
          Text('Quick Delivery', style: TextStyle(fontFamily: 'MainFont', fontSize: 30 ,color: Colors.white),),
        ],
      ),
    );
  }
}
