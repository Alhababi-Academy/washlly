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
  late String Address;
  late String UserUid;
  late String uidFromServices;
  late String timeAndDate;
  late String uid;
  late String serviceRating;
  late String adminName;
  late String dataMessage;
  late String userFromAdmin;
  var selectedDate;
  double? lat;
  double? long;

  ItemModel({
    required this.Email,
    required this.fullName,
    required this.PhoneNumber,
    required this.BookingStatus,
    required this.reasonOfRej,
    required this.SelectedDate,
    required this.Address,
    required this.ServicePrice,
    required this.TheService,
    required this.Hour,
    required this.uidFromServices,
    required this.timeAndDate,
    required this.uid,
    required this.serviceRating,
    required this.adminName,
    required this.selectedDate,
    required this.dataMessage,
    required this.userFromAdmin,
    required this.lat,
    required this.long,
  });

  ItemModel.fromJson(Map<dynamic, dynamic> json) {
    Firebase.initializeApp();
    Email = json['Email'].toString();
    fullName = json['FullName'].toString();
    PhoneNumber = json['PhoneNumber'].toString();
    BookingStatus = json['BookingStatus'].toString();
    SelectedDate = json['SelectedDate'].toString();
    reasonOfRej = json['ReasonOfRejection'].toString();
    Address = json['Address'].toString();

    userFromAdmin = json['user'].toString();

    ServicePrice = json['ServicePrice'].toString();
    TheService = json['TheService'].toString();
    Hour = json['Hour'].toString();
    timeAndDate = json['timeAndDate'].toString();
    uid = json['UserUid'].toString();
    serviceRating = json['serviceRating'].toString();
    adminName = json['adminName'].toString();
    dataMessage = json['MessageID'].toString();
    selectedDate = json['selectedDate'];
    uidFromServices = json['uid'].toString();
    lat = json['lat'];
    long = json['long'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Address'] = Address;
    data['Email'] = Email;
    data['FullName'] = fullName;
    data['PhoneNumber'] = PhoneNumber;
    data['ReasonOfRejection'] = reasonOfRej;
    data['BookingStatus'] = BookingStatus;
    data['SelectedDate'] = SelectedDate;
    data['ServicePrice'] = ServicePrice;
    data['TheService'] = TheService;
    data['selectedDate'] = selectedDate;
    data['user'] = userFromAdmin;
    data['uid'] = uidFromServices;
    data['Hour'] = Hour;
    data['timeAndDate'] = timeAndDate;
    data['UserUid'] = uid;
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
