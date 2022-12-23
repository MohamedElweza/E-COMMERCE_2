import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: Image.asset('assets/images/hhh.png', fit: BoxFit.cover)),
          SizedBox(height: 20,),
          Text('Secure Payment', style: TextStyle(fontFamily: 'MainFont', fontSize: 30 , color: Colors.white),),
        ],
      ),
    );
  }
}
