import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Error_Alert_Dialog extends StatelessWidget {
  final String message;

  const Error_Alert_Dialog({key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Text(message),
      actions: [
        ElevatedButton(
          child: const Center(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white),
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
