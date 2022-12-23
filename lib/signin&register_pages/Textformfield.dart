import 'package:flutter/material.dart';

import '../local/signin&register_db/Helper.dart';


class GetTextFormField extends StatefulWidget {
  TextEditingController controller;
  String hintName;
  IconData icon;
  bool isObscureText;
  TextInputType inputType;
  bool isEnable;

  GetTextFormField(
      {required this.controller,
        required this.hintName,
        required this.icon,
        this.isObscureText = false,
        this.inputType = TextInputType.text,
        this.isEnable = true});

  @override
  State<GetTextFormField> createState() => _GetTextFormFieldState();
}

class _GetTextFormFieldState extends State<GetTextFormField> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isObscureText,
        enabled: widget.isEnable,
        keyboardType: widget.inputType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter ${widget.hintName}';
          }
          if (widget.hintName == "Email" && !validateEmail(value)) {
            return 'Please Enter Valid Email';
          }
          return null;
        },
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          prefixIcon: Icon(widget.icon, color: Colors.red,),
          hintText: widget.hintName,
          labelText: widget.hintName,
          fillColor: Colors.grey[200],
          filled: true,
        ),
      ),
    );
  }
}