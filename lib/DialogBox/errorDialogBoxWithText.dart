import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../global/global.dart';

class Error_Alert_Dialog_Text extends StatelessWidget {
  final String message;
  TextEditingController reason = TextEditingController();
  String id;

  Error_Alert_Dialog_Text({key, required this.message, required this.reason, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      actions: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(3),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          padding: const EdgeInsets.all(1.0),
          margin: const EdgeInsets.only(right: 10, top: 4, bottom: 4, left: 10),
          child: TextField(
            controller: reason,
            decoration: const InputDecoration(
              hintText: "Rejected Because?",
              border: InputBorder.none,
            ),
          ),
        ),
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
            print(reason.text.trim().toString());
            uploadMessageToDatabase();
            Navigator.pop(context);
            // Navigator.pop(context);
          },
        ),
      ],
    );
  }

  uploadMessageToDatabase() async {
    var user = sharedPreferences?.getString("uid");
    print("This is the id from error ${id}");
    FirebaseFirestore.instance.collection("services").doc(id).update({
      "ReasonOfRejection": reason.text.trim().toString(),
    });
  }
}
