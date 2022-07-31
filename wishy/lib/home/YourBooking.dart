import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wishy/widgets/rateUs.dart';
import '../global/global.dart';
import 'myDrawer.dart';

class MyBooking extends StatefulWidget {
  @override
  _MyBooking createState() => _MyBooking();
}

class _MyBooking extends State<MyBooking> {
  var user = sharedPreferences?.getString("uid");
  late var conver;

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('services');
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(),
        title: const Text(
          "Your Booking",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      drawer: myDrawer(),
      body: FutureBuilder<DocumentSnapshot>(
        future: users.doc(user).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            if ("${data['serviceRating']}" != "null") {
              var raing = "${data['serviceRating']}";
              conver = double.parse(raing);
            }

            // return Text("Full Name: ${data['BookingStatus']} ${data['last_name']}");
            return sourceInfo(data, background: Colors.white);
          }

          return const Text("loading");
        },
      ),
    );
  }

  Widget sourceInfo(Map<String, dynamic> data,
      {required Color background, removeCarFunction}) {
    return InkWell(
      splashColor: Colors.pink[100],
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
          height: 230,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/img/maintenance4+.png",
                width: 80.0,
                height: 80.0,
                color: Colors.white,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Text(
                                  "Name: ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.0,
                                      fontFamily: "arial"),
                                ),
                                Text(
                                  "${data['fullName']}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Text(
                                  "PhoneNumber: ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.0,
                                      fontFamily: "arial"),
                                ),
                                Text(
                                  "${data['PhoneNumber']}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Text(
                                  "Email: ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.0,
                                      fontFamily: "arial"),
                                ),
                                Text(
                                  "${data['Email']}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Text(
                                  "The Service: ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.0,
                                      fontFamily: "arial"),
                                ),
                                Text(
                                  "${data['TheService']}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Text(
                                  "Service Price: ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.0,
                                      fontFamily: "arial"),
                                ),
                                Text(
                                  "${data['ServicePrice']}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Text(
                                  "Date: ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.0,
                                      fontFamily: "arial"),
                                ),
                                Text(
                                  "${data['timeAndDate']}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Text(
                                  "Booking Status: ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.0,
                                      fontFamily: "arial"),
                                ),
                                Text(
                                  "${data['BookingStatus']}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if ("${data['ReasonOfRejection']}" != null) ...[
                            Expanded(
                              child: Text(
                                "${data['ReasonOfRejection']}",
                                softWrap: true,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ] else
                            ...[],
                        ],
                      ),
                      if ("${data['serviceRating']}" == "null") ...[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.white,
                            primary: Colors.green,
                          ),
                          child: const Text("Rate Us"),
                          onPressed: () {
                            rateUsFunction();
                          },
                        ),
                      ] else ...[
                        RatingBarIndicator(
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemSize: 25,
                          rating: conver,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  messageInsideBooking() {
    FirebaseFirestore.instance.collection("services").get().then((snapshot) {
      // dataGet = snapshot.data()!["ReasonOfRejection"];
      // print("This is $dataGet");
      // if (dataGet != null) {
      //   return dataGet.toString();
      // }
    });
  }

  rateUsFunction() {
    // Route route = MaterialPageRoute(builder: (c) => rateUs(message: '',));
    // Navigator.pushReplacement(context, route);
    showDialog(
      context: context,
      builder: (c) {
        return rateUs(
          message: 'Rate Us',
        );
      },
    );
  }
}
