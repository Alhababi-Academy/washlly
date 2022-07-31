import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wishy/global/global.dart';
import 'package:wishy/home/booking_page.dart';
import 'package:wishy/home/third_booking_page.dart';
import 'package:wishy/home/time_pick.dart';

import '../widgets/loadingWidget.dart';

class second_booking_page extends StatefulWidget {
  @override
  _second_booking_page createState() => _second_booking_page();
}

enum Prices { smallPrice, meduimPrice, largePrice }

_timeToString(Prices? price) {
  switch (price) {
    case Prices.smallPrice:
      return "130PHP (Sedan)";
    case Prices.meduimPrice:
      return "170PHP (Crossover)";
    case Prices.largePrice:
      return "210PHP (SUV)";
  }
}

var small;
var big;

String trying = Prices.smallPrice.index.toString();
Prices? _Prices = Prices.smallPrice;

class _second_booking_page extends State<second_booking_page> {
  String silver = "Silver";
  String price = "80PHP";
  String status = "Pending";
  String timeAndDate = "";
  String Latitude = "";
  String Longtitude = "";
  String reason = '';
  String serviceRating = 'null';
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    _timeToString(Prices.smallPrice);
    _Prices = Prices.smallPrice;
    small = _timeToString(Prices.smallPrice).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(),
        title: const Text(
          "Book Now",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Silver",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    small.toString(),
                    style: const TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.w800,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.check,
                          color: Colors.blue,
                          size: 27,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Body Wash With Shampoo.",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.check,
                          color: Colors.blue,
                          size: 27,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Interior Vacuum, Dust & Cleaning.",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.check,
                          color: Colors.blue,
                          size: 27,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Light Interior Detailing With \nSpecial Products.",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.check,
                          color: Colors.blue,
                          size: 27,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Tires and Wheels Wash and Shine.",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: <Widget>[
                        ListTile(
                          visualDensity: const VisualDensity(vertical: -4),
                          horizontalTitleGap: -5,
                          title: const Text('Regular Car (Sedan)'),
                          leading: Radio(
                            value: Prices.smallPrice,
                            groupValue: _Prices,
                            onChanged: (Prices? value) {
                              setState(() {
                                _Prices = value;
                                small =
                                    _timeToString(Prices.smallPrice).toString();
                                price;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          visualDensity: const VisualDensity(vertical: -4),
                          horizontalTitleGap: -5,
                          title: const Text('Medium Car (Crossover)'),
                          leading: Radio(
                            value: Prices.meduimPrice,
                            groupValue: _Prices,
                            onChanged: (Prices? value) {
                              setState(() {
                                _Prices = value;
                                small = _timeToString(Prices.meduimPrice)
                                    .toString();
                                price;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          visualDensity: const VisualDensity(vertical: -4),
                          horizontalTitleGap: -5,
                          title: const Text('Large Car (SUV)'),
                          leading: Radio(
                            value: Prices.largePrice,
                            groupValue: _Prices,
                            onChanged: (Prices? value) {
                              setState(() {
                                _Prices = value;
                                small =
                                    _timeToString(Prices.largePrice).toString();
                                price;
                                print(small);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Including: Floor mats casing, trash bag, tissue pack, perfuming.",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            fixedSize: const Size(110, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1)),
                          ),
                          child: const Text(
                            "Prev",
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            booking_pageThree_Prev();
                          },
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            fixedSize: const Size(110, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1)),
                          ),
                          child: const Text(
                            "Next",
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            booking_pageThree();
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                        fixedSize: Size(MediaQuery.of(context).size.width, 47),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                      child: const Text(
                        "Select",
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                      onPressed: () {
                        uploadServiceToDatabase();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  booking_pageThree() {
    Route route = MaterialPageRoute(builder: (c) => third_booking_page());
    Navigator.push(context, route);
  }

  booking_pageThree_Prev() {
    Route route = MaterialPageRoute(builder: (c) => booking_page());
    Navigator.pop(context, route);
  }

  uploadServiceToDatabase() {
    var user = sharedPreferences?.getString("uid");
    showDialog(
        context: context,
        builder: (c) {
          return circularProgress();
        });
    UploadDataNow(user);
  }

  Future UploadDataNow(String? user) async {
    await FirebaseFirestore.instance.collection("services").doc(user).set({
      "uid": user.toString(),
      "TheService": silver.toString(),
      "ServicePrice": small.toString(),
      "BookingStatus": status.toString(),
      "timeAndDate": timeAndDate.toString(),
      "ReasonOfRejection": reason.toString(),
      "selectedDate": selectedDate,
      // "serviceRating": serviceRating.trim(),
    });
    Route route = MaterialPageRoute(builder: (c) => time_picker());
    Navigator.pushReplacement(context, route);
  }
}
