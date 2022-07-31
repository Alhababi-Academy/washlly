import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wishy/DialogBox/errorDialog.dart';

import '../global/global.dart';
import '../widgets/loadingWidget.dart';
import 'homePage.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;
  late LatLng latLatPostion;
  var user = sharedPreferences?.getString("uid");

  void locatePostion() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    CurrentPosition = position;

    latLatPostion = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        CameraPosition(target: latLatPostion, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.427934534, -122.085),
    zoom: 14.4744,
  );

  late Position CurrentPosition;
  late var geoLocator = Geolocator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: GoogleMap(
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              initialCameraPosition: _kGooglePlex,
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controllerGoogleMap.complete(controller);
                newGoogleMapController = controller;

                locatePostion();
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter your Location",
                suffixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.all(5),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 90,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                fixedSize: const Size(170, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                "Next",
                style: TextStyle(
                  fontSize: 21,
                ),
              ),
              onPressed: () {
                UploadSelectedDate();
              },
            ),
          ),
        ],
      ),
    );
  }

  UploadSelectedDate() async {
    showDialog(
      context: context,
      builder: (c) {
        return const Error_Alert_Dialog(
            message: "Thank you for booking with us.");
      },
    ).then((value) {
      thisIsToGetAll();
    });
  }

  Future thisIsToGetAll() async {
    await FirebaseFirestore.instance.collection("services").doc(user).update({
      "Latitude": latLatPostion.latitude,
      "Longtitude": latLatPostion.longitude,
    });

    Route route = MaterialPageRoute(builder: (c) => Home_page());
    Navigator.push(context, route);
  }
}
