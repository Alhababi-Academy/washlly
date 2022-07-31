import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wishy/Config/item.dart';
import 'package:wishy/global/global.dart';
import 'package:wishy/home/myDrawer.dart';
import 'package:wishy/home/time_pick.dart';

class chatPage extends StatefulWidget {
  _chatPage createState() => _chatPage();
}

var currentUserFromSHraedPrEmail = sharedPreferences!.get("email");
var currentUserUid = sharedPreferences!.get("uid");
var gettingName = sharedPreferences!.getString("FullName");

class _chatPage extends State<chatPage> {
  TextEditingController msg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    setState(() {
      currentUserFromSHraedPrEmail = sharedPreferences!.get("email");
      currentUserUid = sharedPreferences!.get("uid");
      gettingName = sharedPreferences!.getString("FullName");
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: myDrawer(),
      appBar: AppBar(
        title: Text(gettingName ?? ""),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Displaying Messgaes
          const SizedBox(
            height: 550,
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              reverse: true,
              child: displayingMessage(),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border:
                    Border(top: BorderSide(color: Colors.black, width: 0.4))),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: msg,
                    decoration:
                        const InputDecoration(hintText: "Enter Message"),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (msg.text.isNotEmpty) {
                      FirebaseFirestore.instance
                          .collection("users")
                          .doc(currentUserUid.toString())
                          .collection("chats")
                          .add({
                        "msg": msg.text.trim(),
                        "user": currentUserUid.toString(),
                        "email": currentUserFromSHraedPrEmail.toString(),
                        "time": DateTime.now(),
                        "name": gettingName.toString(),
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
  const displayingMessage({Key? key}) : super(key: key);

  _displayingMessage createState() => _displayingMessage();
}

class _displayingMessage extends State<displayingMessage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(currentUserUid.toString())
            .collection("chats")
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
                if (x['user'] == currentUserUid) {
                  return ListTile(
                      title: Column(
                    crossAxisAlignment: gettingName == x['name']
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        color: gettingName == x['name']
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
