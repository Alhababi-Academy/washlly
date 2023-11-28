import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:washly/widgets/customTextField.dart';

import 'DialogBox/errorDialog.dart';
import 'DialogBox/loadingDialog.dart';
import 'global/global.dart';
import 'home/homePage.dart';
import 'loginPage.dart';

class register_wishy extends StatefulWidget {
  @override
  _register_wishy createState() => _register_wishy();
}

class _register_wishy extends State<register_wishy> {
  final TextEditingController _full_name = TextEditingController();
  final TextEditingController _phone_number = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirm_password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              "assets/img/login.png",
              height: 120,
              width: 120,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Register Here",
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
                    controller: _full_name,
                    data: Icons.person,
                    hintText: "Full Name",
                    isObsecure: false,
                  ),
                  CustomTextField(
                    controller: _phone_number,
                    data: Icons.phone,
                    hintText: "Phone Number",
                    isObsecure: false,
                  ),
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
                  CustomTextField(
                    controller: _confirm_password,
                    data: Icons.lock,
                    hintText: "Confirm Password",
                    isObsecure: true,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      registerFunciton();
                    },
                    child: const Text(
                      "Register",
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
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => login_page())),
                    icon: (const Icon(
                      Icons.account_box_rounded,
                      color: Colors.white,
                    )),
                    label: const Text(
                      "You have an account? Login",
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
    );
  }

  Future<void> registerFunciton() async {
    _password.text == _confirm_password.text
        ? _email.text.isNotEmpty &&
                _password.text.isNotEmpty &&
                _confirm_password.text.isNotEmpty &&
                _phone_number.text.isNotEmpty &&
                _full_name.text.isNotEmpty
            ? uploadDataToStorage()
            : displayDialog("Please Fill up the Complate Form ")
        : displayDialog("Password is not Matching");
  }

  displayDialog(String msg) {
    showDialog(
      context: context,
      builder: (c) {
        return Error_Alert_Dialog(
          message: msg,
        );
      },
    );
  }

  void uploadDataToStorage() async {
    showDialog(
        context: context,
        builder: (c) {
          return const LoadingDialog(
            message: "Authenticating Please Hold on......",
          );
        });

    User? currentUser;

    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: _email.text.trim(), password: _password.text.trim())
        .then((auth) {
      currentUser = auth.user;
      print("this is the user $currentUser");
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return Error_Alert_Dialog(message: error.message.toString());
          });
    });

    if (currentUser != null) {
      saveUserInfoFireStore(currentUser!).then((value) {
        print("this is the user $currentUser");
        Navigator.pop(context);
        Route route = MaterialPageRoute(builder: (c) => Home_page());
        Navigator.pushReplacement(context, route);
      });
    }
  }

  Future saveUserInfoFireStore(User currentUser) async {
    FirebaseFirestore.instance.collection("users").doc(currentUser.uid).set({
      "UserUid": currentUser.uid,
      "Email": currentUser.email,
      "FullName": _full_name.text.trim(),
      "PhoneNumber": _phone_number.text.trim(),
    });

    //Save Data Locally
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.setString("uid", currentUser.uid);
    await sharedPreferences!.setString("email", currentUser.email.toString());
    await sharedPreferences!.setString("FullName", _full_name.text.trim());
    await sharedPreferences!
        .setString("PhoneNumber", _phone_number.text.trim());
  }
}
