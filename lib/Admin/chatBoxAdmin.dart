import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../home/chatPage.dart';
import 'adminDrawer.dart';

var jj;
var gettingNamed = "Admin";

class chatAdminBox extends StatefulWidget {
  String modelData;

  chatAdminBox({required this.modelData});

  _chatAdminBox createState() => _chatAdminBox();
}

class _chatAdminBox extends State<chatAdminBox> {
  TextEditingController msg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    setState(() {
      widget.modelData;
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: adminDrawer(),
      appBar: AppBar(
        title: Text("Admin"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Displaying Messgaes
          SizedBox(
            height: 550,
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              reverse: true,
              child: displayingMessage(
                modelData: widget.modelData,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border:
                    Border(top: BorderSide(color: Colors.black, width: 0.4))),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: msg,
                    decoration: InputDecoration(hintText: "Enter Message"),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (msg.text.isNotEmpty) {
                      FirebaseFirestore.instance
                          .collection("users")
                          .doc(widget.modelData.toString())
                          .collection("chats")
                          .add({
                        "msg": msg.text.trim(),
                        "user": widget.modelData,
                        "email": currentUserFromSHraedPrEmail.toString(),
                        "time": DateTime.now(),
                        "name": "Admin",
                      });
                      msg.clear();
                    }
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class displayingMessage extends StatefulWidget {
  String modelData;

  displayingMessage({required this.modelData});

  _displayingMessage createState() => _displayingMessage();
}

class _displayingMessage extends State<displayingMessage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(widget.modelData)
            .collection("chats")
            .where("user", isEqualTo: widget.modelData)
            .orderBy("time", descending: true)
            // .where("name", isEqualTo: gettingName)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
              reverse: true,
              itemCount: snapshot.data!.docs.length,
              shrinkWrap: true,
              primary: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, i) {
                QueryDocumentSnapshot x = snapshot.data!.docs[i];
                if (x['user'] == widget.modelData) {
                  return ListTile(
                      title: Column(
                    crossAxisAlignment: gettingNamed == x['name']
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        color: gettingNamed == x['name']
                            ? Colors.blue.withOpacity(0.2)
                            : Colors.amber.withOpacity(0.1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(x['msg']),
                            Text(
                              x['name'],
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ));
                }
                return const Text("");
              });
        });
  }
}
