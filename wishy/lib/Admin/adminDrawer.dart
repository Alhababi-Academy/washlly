import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wishy/Admin/allUsers.dart';
import 'package:wishy/global/global.dart';
import '../loginPage.dart';
import 'aboutUsAdmin.dart';
import 'acceptRequestAdmin.dart';
import 'adminHomePage.dart';
import 'chatBoxAdmin.dart';
import 'myBooking.dart';

class adminDrawer extends StatelessWidget {
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
                      "Admin Home Page",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Route route =
                      MaterialPageRoute(builder: (c) => adminHomePage());
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
                      Icons.account_circle,
                      color: Colors.white,
                    ),
                    title: const Text(
                      "All users",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Route route =
                      MaterialPageRoute(builder: (c) => allUsers());
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
                      "New Booking",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Route route =
                      MaterialPageRoute(builder: (c) => acceptBookingAdmin());
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
                      MaterialPageRoute(builder: (c) => chatBoxAdmin());
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
                      Route route = MaterialPageRoute(builder: (c) => AdminAbout());
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
