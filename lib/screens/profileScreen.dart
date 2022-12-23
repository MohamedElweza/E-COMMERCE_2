import 'package:T3ala/signin&register_pages/UserModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../signin&register_pages/Textformfield.dart';

class Profile extends StatefulWidget {
  Profile( {Key? key}) : super(key: key);

  // UserModel U_data;


  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final TextEditingController _UserName = TextEditingController();
  final TextEditingController _Password = TextEditingController();
  final TextEditingController _Email = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // _UserName.text = widget.U_data.user_name;
    //
    // _Password.text = widget.U_data.password;
    //
    // _Email.text = widget.U_data.email;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
              fontFamily: 'MainFont', fontSize: 35, color: Colors.redAccent),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage('assets/images/p.jpg')),
              const SizedBox(height: 10.0),
              GetTextFormField(
                controller: _UserName,
                icon: Icons.person,
                hintName: 'UserName',
                isObscureText: true,
              ),
              const SizedBox(height: 10.0),
              GetTextFormField(
                controller: _Email,
                icon: Icons.email,
                hintName: 'Email',
                isObscureText: true,
              ),
              const SizedBox(height: 10.0),
              GetTextFormField(
                controller: _Password,
                icon: Icons.lock,
                hintName: 'Password',
                isObscureText: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
