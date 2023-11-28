import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../global/global.dart';

class rateUs extends StatelessWidget {
  var user = sharedPreferences?.getString("uid");
  final String message;
  double rating = 0;
  TextEditingController reason = TextEditingController();

  rateUs({key, required this.message}) : super(key: key);

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
          child: RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              saveTheRatingToDataBase(rating);
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  saveTheRatingToDataBase(double rating) async {
    print(rating);
    FirebaseFirestore.instance.collection("services").doc(user).update({
      "serviceRating": rating.toString(),
    });
  }
}
