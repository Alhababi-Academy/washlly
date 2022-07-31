import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData data;
  final String hintText;
  bool isObsecure = true;

  CustomTextField(
      {required this.controller,
      required this.data,
      required this.hintText,
      required this.isObsecure});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      padding: const EdgeInsets.all(1.0),
      margin: const EdgeInsets.only(right: 20, top: 4, bottom: 4, left: 20),
      child: TextFormField(
        style: const TextStyle(color: Colors.indigoAccent, fontFamily: "arial"),
        controller: controller,
        obscureText: isObsecure,
        cursorColor: Colors.indigoAccent,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            data,
            color: Colors.indigoAccent,
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
