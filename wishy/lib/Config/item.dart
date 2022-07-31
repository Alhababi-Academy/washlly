import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ItemModel {
  late String Email;
  late String reasonOfRej;
  late String fullName;
  late String PhoneNumber;
  late String BookingStatus;
  late String SelectedDate;
  late String ServicePrice;
  late String TheService;
  late String Hour;
  late String timeAndDate;
  late String uid;
  late String serviceRating;

  ItemModel({
    required this.Email,
    required this.fullName,
    required this.PhoneNumber,
    required this.BookingStatus,
    required this.reasonOfRej,
    required this.SelectedDate,
    required this.ServicePrice,
    required this.TheService,
    required this.Hour,
    required this.timeAndDate,
    required this.uid,
    required this.serviceRating,
  });

  ItemModel.fromJson(Map<String, dynamic> json) {
    Firebase.initializeApp();
    Email = json['Email'].toString();
    fullName = json['fullName'].toString();
    PhoneNumber = json['PhoneNumber'].toString();
    BookingStatus = json['BookingStatus'].toString();
    SelectedDate = json['SelectedDate'].toString();
    reasonOfRej = json['ReasonOfRejection'].toString();
    ServicePrice = json['ServicePrice'].toString();
    TheService = json['TheService'].toString();
    Hour = json['Hour'].toString();
    timeAndDate = json['timeAndDate'].toString();
    uid = json['uid'].toString();
    serviceRating = json['serviceRating'].toString();


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Email'] = Email;
    data['fullName'] = fullName;
    data['PhoneNumber'] = PhoneNumber;
    data['ReasonOfRejection'] = reasonOfRej;
    data['BookingStatus'] = BookingStatus;
    data['SelectedDate'] = SelectedDate;
    data['ServicePrice'] = ServicePrice;
    data['TheService'] = TheService;
    data['Hour'] = Hour;
    data['timeAndDate'] = timeAndDate;
    data['uid'] = uid;
    data['serviceRating'] = serviceRating;

    return data;
  }
}

class VisitDate {
  String date;

  VisitDate({required this.date});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[date] = date;
    return data;
  }
}
