import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wishy/DialogBox/errorDialog.dart';
import 'package:wishy/DialogBox/loadingDialog.dart';
import 'package:wishy/global/global.dart';
import 'package:wishy/widgets/customTextField.dart';
import 'package:wishy/wishy_home.dart';
import 'Admin/adminLogin.dart';
import 'home/homePage.dart';

class login_page extends StatefulWidget {
  @override
  _login_page createState() => _login_page();
}

class _login_page extends State<login_page> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blueAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                "assets/img/login.png",
                height: 180,
                width: 180,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Login Here",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _email,
                      data: Icons.email,
                      hintText: "Email",
                      isObsecure: false,
                    ),
                    CustomTextField(
                      controller: _password,
                      data: Icons.lock,
                      hintText: "Password",
                      isObsecure: true,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        formValidation();
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigoAccent,
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      height: 4.0,
                      width: _screenWidth * 0.8,
                      color: Colors.blue.shade50,
                    ),
                    TextButton.icon(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => register_wishy()),
                      ),
                      icon: (const Icon(
                        Icons.account_box_rounded,
                        color: Colors.white,
                      )),
                      label: const Text(
                        "New Here? Register",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    TextButton.icon(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminSignInPage())),
                      icon: (Icon(
                        Icons.nature_people,
                        color: Colors.blue.shade50,
                      )),
                      label: const Text(
                        "I'm Admin",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  formValidation() {
    _email.text.isNotEmpty && _password.text.isNotEmpty
        ? loginUser()
        : showDialog(
            context: context,
            builder: (c) {
              return const Error_Alert_Dialog(
                  message: "Please fill the the complete form");
            });
  }

  void loginUser() async {
    showDialog(
        context: context,
        builder: (c) {
          return const LoadingDialog(message: "Checking Data, Please wait...");
        });
    User? currentUser;
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: _email.text.trim(), password: _password.text.trim())
        .then((authUser) {
      currentUser = authUser.user!;
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return Error_Alert_Dialog(
              message: error.message.toString(),
            );
          });
    });

    if (currentUser != null) {
      readData(currentUser!).then((value) {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (c) => Home_page()));
      });
    }
  }

  Future readData(User currentUser) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.uid)
        .get()
        .then((snapshot) async {
      await sharedPreferences!.setString("uid", currentUser.uid);
      await sharedPreferences!.setString("email", snapshot.data()!["Email"]);
      await sharedPreferences!
          .setString("FullName", snapshot.data()!["FullName"]);
      await sharedPreferences!
          .setString("PhoneNumber", snapshot.data()!["PhoneNumber"]);
    });
  }
}
