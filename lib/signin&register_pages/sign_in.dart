import 'package:T3ala/screens/tabsscreen.dart';
import 'package:T3ala/signin&register_pages/registerPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../local/signin&register_db/Helper.dart';
import '../local/signin&register_db/dbHelper.dart';
import 'Textformfield.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  final _conUserId = TextEditingController();
  final _conPassword = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    dbHelper = Dbhelper();
    super.initState();
  }

  login() async {
    String uid = _conUserId.text;
    String passwd = _conPassword.text;

    if (uid.isEmpty) {
      alertDialog(context, "Please Enter User ID");
    } else if (passwd.isEmpty) {
      alertDialog(context, "Please Enter Password");
    } else {
      await dbHelper.getLoginUser(uid, passwd).then((userData) {
        if (userData != null) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const TabsScreen()),
                    (Route<dynamic> route) => false);
        } else {
          alertDialog(context, "Error: User Not Found");
        }
      }).catchError((error) {
        print(error);
        alertDialog(context, "Error: Login Fail");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:
      SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 85,),
                const Padding(
                  padding: EdgeInsets.only(bottom: 40.0),
                  child: Icon(Icons.shopping_cart, size: 100, color: Colors.red,),
                ),
                const SizedBox(height: 10,),
                 Text('Hallo Again!', style: GoogleFonts.bebasNeue(fontSize: 50)),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Welcome back, you\'ve been missed!', style: TextStyle( fontSize: 20, fontFamily: 'Myfont'),),
                ),
                const SizedBox(height: 15,),
                GetTextFormField(
                    controller: _conUserId,
                    icon: Icons.person,
                    hintName: 'User ID'),
                const SizedBox(height: 10.0),
                GetTextFormField(
                  controller: _conPassword,
                  icon: Icons.lock,
                  hintName: 'Password',
                  isObscureText: true,
                ),
                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextButton(
                    onPressed: login,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.deepPurple, borderRadius: BorderRadius.circular(12.0)),
                      child:  Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Center(
                          child: Text('Sign In', style: GoogleFonts.radley(fontSize: 20, color: Colors.white) ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 13,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a member?', style: TextStyle( fontWeight: FontWeight.bold)),
                    TextButton( onPressed: () {
                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: RegisterPage()));
                    }, child: const Text(' Register Now', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),) ,)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
