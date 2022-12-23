import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: Image.asset('assets/images/moa.png', fit: BoxFit.cover)),
          SizedBox(height: 20,),
          Text('Easy Shopping', style: TextStyle(fontFamily: 'MainFont', fontSize: 30 , color: Colors.white),),
        ],
      ),
    );
  }
}
