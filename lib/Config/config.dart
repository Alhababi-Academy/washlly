import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/editable_text.dart';

import 'package:shared_preferences/shared_preferences.dart';

class WishyApp {
  static const String appName = 'RancoApp';

  static SharedPreferences? sharedPreferences;
  static User? user;
  static FirebaseAuth? auth;
  static FirebaseFirestore? firebase;


  static const String userUID = 'uid';


  static const String fullName = 'fullName';
  static const String orderTime = 'orderTime';
  static const String isSuccess = 'isSuccess';
  static const String email = 'email';
  static const String userName = 'userName';

  static SharedPreferences? _preferences;
  // static const _keyUsername = 'userName';
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();
  static Future setUserName(String nameTextEditingController) async =>
      await _preferences?.setString(userName, nameTextEditingController);

  static String? getUsername() => _preferences?.getString(userName);
}
