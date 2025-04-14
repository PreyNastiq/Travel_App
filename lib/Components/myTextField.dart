import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscure;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscure});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          fillColor: Colors.blue.shade100,
          filled: true,
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(10)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(10)),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
