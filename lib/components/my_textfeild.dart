import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});
  final controller;
  final hintText;
  final obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            fillColor: Colors.grey.shade300,
            filled: true,
            hintText: hintText),
      ),
    );
  }
}
