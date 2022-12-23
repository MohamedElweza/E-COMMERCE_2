import 'package:T3ala/signin&register_pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../local/signin&register_db/Helper.dart';
import '../local/signin&register_db/dbHelper.dart';
import 'Textformfield.dart';
import 'UserModel.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = new GlobalKey<FormState>();

  final _conUserId = TextEditingController();

  final _conUserName = TextEditingController();

  final _conEmail = TextEditingController();

  final _conPassword = TextEditingController();

  final _conCPassword = TextEditingController();

  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = Dbhelper();
  }

  signUp() async {
    String uid = _conUserId.text;
    String uname = _conUserName.text;
    String email = _conEmail.text;
    String passwd = _conPassword.text;
    String cpasswd = _conCPassword.text;

    if (_formKey.currentState!.validate()) {
      if (passwd != cpasswd) {
        alertDialog(this.context, 'Password Mismatch');
      } else {
        _formKey.currentState!.save();

        UserModel uModel = UserModel(uid, uname, email, passwd);
        await dbHelper.saveData(uModel).then((userData) {
          alertDialog(this.context, "Successfully Saved");

          Navigator.push(
              this.context, MaterialPageRoute(builder: (_) => SignIn()));
        }).catchError((error) {
          print(error);
          alertDialog(this.context, "Error: Data Save Fail");
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 35,),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 40.0),
                    child: Icon(Icons.how_to_reg, size: 100, color: Colors.red,),
                  ),
                  const SizedBox(height: 5,),
                  Text('Sign Up Now!', style: GoogleFonts.bebasNeue(fontSize: 50)),
                  const SizedBox(height: 15,),
                  GetTextFormField(
                      controller: _conUserId,
                      icon: Icons.person,
                      hintName: 'User ID'),
                  const SizedBox(height: 10.0),
                  GetTextFormField(
                      controller: _conUserName,
                      icon: Icons.person_outline,
                      inputType: TextInputType.name,
                      hintName: 'User Name'),
                  const SizedBox(height: 10.0),
                  GetTextFormField(
                      controller: _conEmail,
                      icon: Icons.email,
                      inputType: TextInputType.emailAddress,
                      hintName: 'Email'),
                  const SizedBox(height: 10.0),
                  GetTextFormField(
                    controller: _conPassword,
                    icon: Icons.lock,
                    hintName: 'Password',
                    isObscureText: true,
                  ),
                  const SizedBox(height: 10.0),
                  GetTextFormField(
                    controller: _conCPassword,
                    icon: Icons.lock,
                    hintName: 'Confirm Password',
                    isObscureText: true,
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextButton(
                      onPressed: signUp,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.deepPurple, borderRadius: BorderRadius.circular(12.0)),
                        child:  Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Center(
                            child: Text('Register', style: GoogleFonts.radley(fontSize: 20, color: Colors.white) ),
                          ),
                        ),
                      ),
                    ),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Does you have account? '),
                TextButton(
                  child: const Text('Sign In', style: TextStyle(color: Colors.blue),),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(child: SignIn(), type: PageTransitionType.fade),
                            (Route<dynamic> route) => false);
                  },
                )
              ],
            ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

