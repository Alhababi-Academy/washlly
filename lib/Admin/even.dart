import 'package:firebase_core/firebase_core.dart';

class Event {
  String name;
  Event({required this.name});

  String toString() => this.name;

  Event.fromJson(Map<dynamic, dynamic> json, this.name) {
    name = json['name'];
    Firebase.initializeApp();
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}
