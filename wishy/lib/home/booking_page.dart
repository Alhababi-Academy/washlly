import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wishy/global/global.dart';
import 'package:wishy/home/second_booking_page.dart';
import 'package:wishy/home/time_pick.dart';
import '../widgets/loadingWidget.dart';

class booking_page extends StatefulWidget {
  const booking_page({Key? key}) : super(key: key);

  @override
  _booking_page createState() => _booking_page();
}

enum Prices { smallPrice, meduimPrice, largePrice }

_timeToString(Prices? price) {
  switch (price!) {
    case Prices.smallPrice:
      return "100PHP";
    case Prices.meduimPrice:
      return "140PHP";
    case Prices.largePrice:
      return "180PHP";
  }
}

var small;
var big;

String trying = Prices.smallPrice.index.toString();
Prices? _Prices = Prices.smallPrice;

class _booking_page extends State<booking_page> {
  String bronze = "Bronze";
  String LargePrice = "80";
  String status = "Pending";
  String timeAndDate = "";
  String Latitude = "";
  String Longtitude = "";
  String reason = '';
  String serviceRating = 'null';
  DateTime? selectedDate = DateTime.now();

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
                    "Bronze",
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
                    height: 40,
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(
                  right: 40,
                  left: 40,
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
                          "Body Wash",
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
                          "Interior Vacuum, Dust",
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
                          "Wiping & Cleaning",
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
                          "Tires Wash",
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
                          title: const Text('Regular Car'),
                          leading: Radio(
                            value: Prices.smallPrice,
                            groupValue: _Prices,
                            onChanged: (Prices? value) {
                              setState(() {
                                _Prices = value;
                                small =
                                    _timeToString(Prices.smallPrice).toString();
                              });
                            },
                          ),
                        ),
                        ListTile(
                          visualDensity: const VisualDensity(vertical: -4),
                          horizontalTitleGap: -5,
                          title: const Text('Meduim Car'),
                          leading: Radio(
                            value: Prices.meduimPrice,
                            groupValue: _Prices,
                            onChanged: (Prices? value) {
                              setState(() {
                                _Prices = value;
                                small = _timeToString(Prices.meduimPrice)
                                    .toString();
                              });
                            },
                          ),
                        ),
                        ListTile(
                          visualDensity: const VisualDensity(vertical: -4),
                          horizontalTitleGap: -5,
                          title: const Text('Large Car'),
                          leading: Radio(
                            value: Prices.largePrice,
                            groupValue: _Prices,
                            onChanged: (Prices? value) {
                              setState(() {
                                _Prices = value;
                                small =
                                    _timeToString(Prices.largePrice).toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
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
                        "Next",
                        style: TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                        booking_pageTwo();
                      },
                    ),
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

  // TakePrice(_Prices){
  //
  //   setState(() {
  //     print("This is Down $Prices");
  //     _Prices;
  //
  //   });
  // }
  booking_pageTwo() {
    Route route = MaterialPageRoute(builder: (c) => second_booking_page());
    Navigator.push(context, route);
  }

  uploadServiceToDatabase() async {
    var user = sharedPreferences?.getString("uid");
    print("This is the user $user");
    // print("This is the user $uid");
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
      "TheService": bronze.toString(),
      "ServicePrice": small.toString(),
      "BookingStatus": status.toString(),
      "timeAndDate": timeAndDate.toString(),
      "ReasonOfRejection": reason.toString(),
      "selectedDate": selectedDate,
      // "serviceRating": serviceRating.trim(),
    });
    Route route = MaterialPageRoute(builder: (c) => const time_picker());
    Navigator.pushReplacement(context, route);
  }
}
