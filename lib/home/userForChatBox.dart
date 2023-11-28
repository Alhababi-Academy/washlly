import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:washly/Config/item.dart';
import 'package:washly/global/global.dart';
import '../widgets/loadingWidget.dart';
import '../widgets/searchBox.dart';
import 'chatPage.dart';

class userForChtBox extends StatefulWidget {
  @override
  _userForChtBox createState() => _userForChtBox();
}

class _userForChtBox extends State<userForChtBox> {
  @override
  Widget build(BuildContext context) {
    var userSharedPrefrences;
    setState(() {
      userSharedPrefrences;
    });
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(),
        title: const Text(
          "washly",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(pinned: true, delegate: SearchBoxDelegate()),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("admins").snapshots(),
            builder: (context, dataSnapshot) {
              return !dataSnapshot.hasData
                  ? const SliverToBoxAdapter(
                      child: Center(
                        child: LinearProgressIndicator(),
                      ),
                    )
                  : SliverStaggeredGrid.countBuilder(
                      crossAxisCount: 1,
                      staggeredTileBuilder: (c) => const StaggeredTile.fit(1),
                      itemBuilder: (context, index) {
                        ItemModel model = ItemModel.fromJson(
                            dataSnapshot.data?.docs[index].data()
                                as Map<String, dynamic>);
                        userSharedPrefrences = model.adminName;
                        // sharedPreferences!
                        //     .setString("adminName", userSharedPrefrences);
                        return dataShowing(model, context);
                      },
                      itemCount: dataSnapshot.data!.docs.length,
                    );
            },
          ),
        ],
      ),
    );
  }

  Widget dataShowing(ItemModel model, BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          sharedPreferences!.getString("adminName");
          sharedPreferences!.getString("ff");
        });
      },
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
                size: 60,
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
                              "Name: " + model.adminName.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        sharedPreferences!
                            .setString("adminName", model.adminName);
                      });
                      var bigCollection = FirebaseFirestore.instance
                          .collection("admins")
                          .snapshots();
                      var collection = FirebaseFirestore.instance
                          .collection('admins')
                          .where("bigCollection",
                              isEqualTo:
                                  sharedPreferences!.getString("adminName"));
                      var querySnapshots = await collection.get();
                      print("This is user ${querySnapshots.docChanges}");
                      // for (var snapshot in querySnapshots.docs) {
                      //   var documentID = snapshot.id; // <-- Document ID
                      //   print("user user ${documentID}");
                      // }

                      Route route =
                          MaterialPageRoute(builder: (c) => chatPage());
                      Navigator.push(context, route);
                    },
                    child: const Text(
                      "Message Admin",
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
