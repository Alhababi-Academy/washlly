import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../DialogBox/errorDialog.dart';
import '../widgets/customTextField.dart';
import '../widgets/loadingWidget.dart';
import '../wishy_home.dart';
import 'adminHomePage.dart';

List<Color> _colors = [Colors.blue.shade300, Colors.deepPurpleAccent.shade100];

class AdminSignInPage extends StatelessWidget {
  const AdminSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _colors,
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: const [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        title: const Text(
          "Washly Admin",
          style: TextStyle(
              fontSize: 25.0, color: Colors.white, fontFamily: "Signatra"),
        ),
        centerTitle: true,
      ),
      body: AdminSignInScreen(),
    );
  }
}

class AdminSignInScreen extends StatefulWidget {
  @override
  _AdminSignInScreenState createState() => _AdminSignInScreenState();
}

class _AdminSignInScreenState extends State<AdminSignInScreen> {
  final TextEditingController _adminIDTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // loginAdmin().whenComplete(() {
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _colors,
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              "assets/img/admin.png",
              height: 200.0,
              width: 200.0,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Admin",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: (_adminIDTextEditingController),
                    data: Icons.person,
                    hintText: "ID",
                    isObsecure: false,
                  ),
                  CustomTextField(
                    controller: _passwordTextEditingController,
                    data: Icons.lock,
                    hintText: "Password",
                    isObsecure: true,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            ElevatedButton(
              onPressed: () {
                _adminIDTextEditingController.text.isNotEmpty &&
                        _passwordTextEditingController.text.isNotEmpty
                    ? loginAdmin()
                    : showDialog(
                        context: context,
                        builder: (c) {
                          return const Error_Alert_Dialog(
                            message: "Please Fill up the Email & Password",
                          );
                        });
              },
              child: const Text(
                "LOGIN",
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurpleAccent,
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              height: 4.0,
              width: _screenWidth * 0.8,
              color: Colors.blue.shade50,
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextButton.icon(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => register_wishy())),
              icon: (const Icon(
                Icons.nature_people,
                color: Colors.deepPurpleAccent,
              )),
              label: const Text(
                "I'm not Admin",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Future<void> loginAdmin() async {
    // This will get all the admins info
    FirebaseFirestore.instance
        .collection("admins")
        .get()
        .then((snapshot) async {
      // this to seperetate it fomr each other
      snapshot.docs.forEach((result) async {
        if (result.data()["id"] != _adminIDTextEditingController.text.trim()) {
          showDialog(
              context: context,
              builder: (c) {
                return const Error_Alert_Dialog(
                  message: "ID is Wrong",
                );
              });
        } else if (result.data()["password"] !=
            _passwordTextEditingController.text.trim()) {
          showDialog(
              context: context,
              builder: (c) {
                return const Error_Alert_Dialog(
                  message: "Password is Wrong",
                );
              });
        } else {
          showDialog(
              context: context,
              builder: (c) {
                return circularProgress();
              });

          Route route = MaterialPageRoute(builder: (c) => adminHomePage());
          Navigator.pushReplacement(context, route);
          setState(() {
            _adminIDTextEditingController.text = "";
            _passwordTextEditingController.text = "";
          });
        }
        print("This is the ID " + result.data()["id"]);
      });
    });
  }
}
