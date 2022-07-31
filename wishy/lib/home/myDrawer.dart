import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wishy/global/global.dart';
import '../loginPage.dart';
import 'YourBooking.dart';
import 'aboutUs.dart';
import 'chatBox.dart';
import 'homePage.dart';

class myDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(color: Colors.blue),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 30.0, bottom: 15.0, right: 10.0, left: 10.0),
              child: Image.asset("assets/img/car-wash.jpg"),
            ),
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.only(top: 1.0),
              child: Column(
                children: [
                  Text(
                    sharedPreferences!.getString("FullName")!,
                    style: const TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    height: 10.0,
                    color: Colors.white,
                    thickness: 2.0,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: const Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Route route =
                          MaterialPageRoute(builder: (c) => Home_page());
                      Navigator.pushReplacement(context, route);
                    },
                  ),
                  const Divider(
                    height: 10.0,
                    color: Colors.white,
                    thickness: 2.0,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.account_balance_outlined,
                      color: Colors.white,
                    ),
                    title: const Text(
                      "My Services",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Route route =
                          MaterialPageRoute(builder: (c) => MyBooking());
                      Navigator.pushReplacement(context, route);
                    },
                  ),
                  const Divider(
                    height: 10.0,
                    color: Colors.white,
                    thickness: 2.0,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.chat,
                      color: Colors.white,
                    ),
                    title: const Text(
                      "ChatBox",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Route route =
                          MaterialPageRoute(builder: (c) => chatBox());
                      Navigator.pushReplacement(context, route);
                    },
                  ),
                  const Divider(
                    height: 10.0,
                    color: Colors.white,
                    thickness: 2.0,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.announcement_outlined,
                      color: Colors.white,
                    ),
                    title: const Text(
                      "About",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Route route = MaterialPageRoute(builder: (c) => About());
                      Navigator.pushReplacement(context, route);
                    },
                  ),
                  const Divider(
                    height: 10.0,
                    color: Colors.white,
                    thickness: 2.0,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    title: const Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () async {
                      await firebaseAuth.signOut().then((c) {
                        Route route =
                            MaterialPageRoute(builder: (c) => login_page());
                        Navigator.pushReplacement(context, route);
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  logout() async {
    // await firebaseAuth.signOut().then((value){
    //   Route route = MaterialPageRoute(
    //     builder: (c) => login_page());
    //   Navigator.pushReplacement(value, route);
    // });
  }
}
