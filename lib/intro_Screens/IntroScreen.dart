import 'package:T3ala/intro_Screens/page1.dart';
import 'package:T3ala/intro_Screens/page3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../signin&register_pages/sign_in.dart';
import 'page2.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 2);
                });
              },
              children: [
                Page1(),
                Page2(),
                Page3(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment(0, .75),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                            onPressed: () {
                              _controller.jumpToPage(3);
                            },
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                  fontFamily: 'MainFont',
                                  color: Colors.white),
                            )),
                      ),
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                      ),
                      onLastPage
                          ? Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.deepPurple,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0))),
                                  // style: ButtonStyle(backgroundColor: Colors.green ,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignIn()));
                                  },
                                  child: Text(
                                    'Done',
                                    style: TextStyle(
                                        fontFamily: 'MainFont',
                                        color: Colors.white),
                                  )),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.deepPurple,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0))),
                                  onPressed: () {
                                    _controller.nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeIn);
                                  },
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                        fontFamily: 'MainFont',
                                        color: Colors.white),
                                  )),
                            ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
