import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:washly/Admin/adminDrawer.dart';
import '../Config/item.dart';
import '../widgets/loadingWidget.dart';
import '../widgets/searchBox.dart';
import 'chatBoxAdmin.dart';

var ss;

class adminChatDisplayUsers extends StatefulWidget {
  @override
  _adminChatDisplayUsers createState() => _adminChatDisplayUsers();
}

class _adminChatDisplayUsers extends State<adminChatDisplayUsers> {
  @override
  Widget build(BuildContext context) {
    var hh = FirebaseFirestore.instance.collection("users").snapshots();
    aa(String something) {
      FirebaseFirestore.instance
          .collection("chats")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          print("this is the user ${result.data()})");
          print(something);
        });
        return something;
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        flexibleSpace: Container(),
        title: const Text(
          "Admin Chat",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      drawer: adminDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(pinned: true, delegate: SearchBoxDelegate()),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("users").snapshots(),
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
                              "Name: " + model.fullName.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15.0),
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
                                  color: Colors.white, fontSize: 15.0),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              "PhoneNumber: " + model.PhoneNumber,
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
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    child: Text(
                      "Message",
                    ),
                    onPressed: () {
                      print("ths is clicked ${model.uid};");
                      setState(() {
                        ss = model.uid;
                      });
                      // Route route = MaterialPageRoute(builder: (c) => chatAdminBox());
                      // Navigator.push(context, route);
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => chatAdminBox(
                                    modelData: ss,
                                  )),
                          (route) => true);
                    },
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
