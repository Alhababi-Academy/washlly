import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wishy/global/global.dart';
import 'package:wishy/loginPage.dart';
import 'package:wishy/wishy_home.dart';

import '../home/homePage.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreen createState() => _MySplashScreen();
}

class _MySplashScreen extends State<MySplashScreen> {
  displaySplash() {
    Timer(const Duration(seconds: 5), () async {
      if (firebaseAuth.currentUser != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (c) => Home_page()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (c) => login_page()),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    displaySplash();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/img/car-wash.jpg",
                width: 200.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Welcome To washly",
                style: TextStyle(color: Colors.white, fontSize: 15.0),
                textDirection: TextDirection.ltr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
