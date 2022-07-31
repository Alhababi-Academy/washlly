import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'myDrawer.dart';

class chatBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(),
        title: const Text(
          "Chat",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      drawer: myDrawer(),
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
                "Coming Soon",
                style: TextStyle(
                    fontSize: 28, color: Colors.blue, fontFamily: "arialbd"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
