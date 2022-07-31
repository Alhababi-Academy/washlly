import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wishy/global/global.dart';
import 'myDrawer.dart';

String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

class chatBox extends StatefulWidget {
  @override
  _chatBox createState() => _chatBox();
}

class _chatBox extends State<chatBox> {
  List<types.Message> _messages = [];
  final _user = types.User(id: sharedPreferences!.getString("uid").toString());

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height;

    void _handleSendPressed(types.PartialText message) {
      final textMessage = types.TextMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: randomString(),
        text: message.text,
      );

      _addMessage(textMessage);
    }

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
      body: SafeArea(
        bottom: false,
        child: Chat(
          messages: _messages,
          onSendPressed: _handleSendPressed,
          user: _user,
        ),
      ),
    );
  }
}
