import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wishy/Admin/adminDrawer.dart';


class AdminAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(),
        title: const Text(
          "About us",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      drawer: adminDrawer(),
      body: Container(
        height: _screenWidth * 2,
        width: _screenWidth * 2,
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Washly Car Wash",
                style: TextStyle(
                    fontSize: 28, color: Colors.blue, fontFamily: "arialbd"),
              ),
              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "Washly is a mobile application that allows users to schedule a car wash."
                      " We genuinely care about our customers,"
                      " So we strive to provide the best washing services possible.",
                  style: TextStyle(
                      fontSize: 21, color: Colors.blue, fontFamily: "arial"),
                ),
              ),
              Row(
                children: [
                  RichText(
                    textAlign: TextAlign.right,
                    text: const TextSpan(
                      children: [
                        WidgetSpan(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            //child: Icon(Icons.link),
                          ),
                        ),
                        TextSpan(
                          //text: 'www.washly.com',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  RichText(
                    textAlign: TextAlign.right,
                    text: const TextSpan(
                      children: [
                        WidgetSpan(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            //child: Icon(Icons.facebook),
                          ),
                        ),
                        TextSpan(
                          //text: 'washly Inc',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
