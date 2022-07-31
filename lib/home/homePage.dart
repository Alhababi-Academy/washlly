import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wishy/home/booking_page.dart';
import 'package:wishy/home/chatPage.dart';
import 'YourBooking.dart';
import 'aboutUs.dart';
import 'myDrawer.dart';

class Home_page extends StatefulWidget {
  @override
  _Home_page createState() => _Home_page();
}

class _Home_page extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(),
        title: const Text(
          "Washly",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      drawer: myDrawer(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 30.0),
          child: GridView.count(
            padding: const EdgeInsets.all(15),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            primary: false,
            crossAxisCount: 2,
            children: [
              GestureDetector(
                onTap: () => {bookNow()},
                child: Card(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add_box,
                        color: Colors.white,
                        size: 33,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Book Now",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => {MyBookingbox()},
                child: Card(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.account_balance_sharp,
                        color: Colors.white,
                        size: 33,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Your Booking",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => {chat()},
                child: Card(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.chat,
                        color: Colors.white,
                        size: 33,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Chat",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => {about()},
                child: Card(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.info,
                        color: Colors.white,
                        size: 33,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "About",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
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

  bookNow() {
    Navigator.of(context);
    Route route = MaterialPageRoute(builder: (c) => booking_page());
    Navigator.push(context, route);
  }

  about() {
    Navigator.of(context);
    Route route = MaterialPageRoute(builder: (c) => About());
    Navigator.push(context, route);
  }

  chat() {
    Navigator.of(context);
    Route route = MaterialPageRoute(builder: (c) => chatPage());
    Navigator.push(context, route);
  }

  MyBookingbox() {
    Navigator.of(context);
    Route route = MaterialPageRoute(builder: (c) => MyBooking());
    Navigator.push(context, route);
  }
}
