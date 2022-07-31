import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../Config/item.dart';
import '../DialogBox/errorDialog.dart';
import '../DialogBox/errorDialogBoxWithText.dart';
import '../widgets/loadingWidget.dart';
import '../widgets/searchBox.dart';
import 'adminDrawer.dart';

class acceptBookingAdmin extends StatefulWidget {
  @override
  _acceptBookingAdmin createState() => _acceptBookingAdmin();
}

class _acceptBookingAdmin extends State<acceptBookingAdmin> {
  String _acceptBooking = "Accepted";
  String _rejectBooking = "Rejected";
  TextEditingController Getreason = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: Colors.blue),
        ),
        title: const Text(
          "New Booking",
          style: TextStyle(
              fontSize: 25.0, color: Colors.white, fontFamily: "Signatra"),
        ),
        centerTitle: true,
      ),
      drawer: adminDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(pinned: true, delegate: SearchBoxDelegate()),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("services")
                .where("BookingStatus", isEqualTo: "Pending")
                .snapshots(),
            builder: (context, dataSnapshot) {
              return !dataSnapshot.hasData
                  ? SliverToBoxAdapter(
                      child: Center(
                        child: circularProgress(),
                      ),
                    )
                  : SliverStaggeredGrid.countBuilder(
                      crossAxisCount: 1,
                      staggeredTileBuilder: (c) => const StaggeredTile.fit(1),
                      itemBuilder: (context, index) {
                        ItemModel model = ItemModel.fromJson(
                            dataSnapshot.data?.docs[index].data()
                                as Map<String, dynamic>);
                        return sourceInfo(model, context,
                            background: Colors.black);
                      },
                      itemCount: dataSnapshot.data!.docs.length,
                    );
            },
          ),
        ],
      ),
    );
  }

  Widget sourceInfo(ItemModel model, BuildContext context,
      {required Color background, removeCarFunction}) {
    return InkWell(
      splashColor: Colors.pink,
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.blueAccent],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 10.0,
              ),
              const Icon(
                Icons.account_circle,
                size: 45,
                color: Colors.white70,
              ),
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              "Name: " + model.fullName.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              "PhoneNumber: " + model.PhoneNumber.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              "Email: " + model.Email.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              "The Service: " + model.TheService.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              "Service Price: " + model.ServicePrice.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              "Booking Status: " +
                                  model.BookingStatus.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              "Date: " + model.timeAndDate.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Row(
                      //   mainAxisSize: MainAxisSize.max,
                      //   children: [
                      //     Expanded(
                      //       child: Text(
                      //         "Hour: " + model.Hour.toString(),
                      //         style: const TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 12.0,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   mainAxisSize: MainAxisSize.max,
                      //   children: [
                      //     Expanded(
                      //       child: Text(
                      //         "Minute: " + model.Minute.toString(),
                      //         style: const TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 12.0,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 10.0, top: 3.0, left: 3.0),
                    child: ElevatedButton(
                      onPressed: () {
                        acceptGuestRequest(model);
                      },
                      child: const Text(
                        "Accept",
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // <-- Radius
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 10.0, left: 3.0, bottom: 3.0),
                    child: ElevatedButton(
                      onPressed: () {
                        regectGuestRequest(model);
                      },
                      child: const Text(
                        "Reject",
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // <-- Radius
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Show Dialog
  displayDialog(String msg) {
    showDialog(
        context: context,
        builder: (c) {
          return Error_Alert_Dialog(
            message: msg,
          );
        });
  }

  //CUstom Dialog with Text
  Error_Alert_Dialog_Tet(String msg, reason) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (c) {
        return Error_Alert_Dialog_Text(message: msg, reason: Getreason);
      },
    );
    print("This is reason for Rejecting ${reason.toString()}");
  }

  // Accept Guest Request
  void acceptGuestRequest(ItemModel model) {
    if (model.uid.isNotEmpty) {
      displayDialog("Booking Accepted!");
      FirebaseFirestore.instance
          .collection("services")
          .doc(model.uid)
          .update({"BookingStatus": _acceptBooking});
    } else {
      print("Something is wrong, please restart the app");
    }
  }

  // Regect Guest Request
  Future<void> regectGuestRequest(ItemModel model) async {
    if (model.uid.isNotEmpty) {
      Error_Alert_Dialog_Tet("Booking Rejected!", Getreason);
      await getMessages();
      FirebaseFirestore.instance.collection("services").doc(model.uid).update({
        "BookingStatus": _rejectBooking,
      });
    } else {
      print("Something is wrong, please restart the app");
    }
  }

  getMessages() {
    print("This is reason for Rejecting ${Getreason.text.toString()}");
    print("This is reason for Rejecting ${Getreason.text.toString()}");
  }
}
