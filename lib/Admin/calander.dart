// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:firebase_core/firebase_core.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter/src/foundation/key.dart';
// // // import 'package:flutter/src/widgets/framework.dart';
// // // import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

// // // class calanderPage extends StatefulWidget {
// // //   const calanderPage({Key? key}) : super(key: key);

// // //   @override
// // //   _calanderPageState createState() => _calanderPageState();
// // // }

// // // late DateTime selectedDateFromFirebase;
// // // // DateTime selectedDateFromFirebase = DateTime.now();

// // // class _calanderPageState extends State<calanderPage> {
// // //   DateTime? selectedDay;

// // //   List? selectedEvent;
// // //   gettingData() async {
// // //     await FirebaseFirestore.instance.collection("services").get().then((value) {
// // //       for (var element in value.docs) {
// // //         // int elm = element.data()['selectedDate'];
// // //         DateTime elm = element.data()['selectedDate'].toDate();

// // //         selectedDateFromFirebase = elm;

// // //         // selectedEvent!.add(selectedDateFromFirebase);
// // //         // setState(() {
// // //         //   selectedEvent;
// // //         // });
// // //         // for (int i = 0; i <= element.data().length; i++) {

// // //         //   print("This is date from firebase $selectedDateFromFirebase");
// // //         // }
// // //         print(
// // //             "This is date from firebase $selectedDateFromFirebase + $selectedDay");
// // //       }
// // //       // value.data()!['selectedDate'];
// // //       // // int elm = element.data()['selectedDate'];
// // //       // DateTime elm = value.data()!['selectedDate'].toDate();

// // //       // selectedDateFromFirebase = elm;
// // //     });
// // //   }

// // //   void _handleData(date) {
// // //     setState(() {
// // //       selectedDay = date;
// // //       selectedEvent = _events[selectedDay] ?? [];
// // //       super.initState();
// // //     });
// // //     print("This is $date");
// // //   }

// // //   @override
// // //   void initState() {
// // //     gettingData();
// // //     selectedEvent = _events[selectedDay] ?? [];
// // //     super.initState();
// // //   }

// // //   final Map<DateTime, List<CleanCalendarEvent>> _events = {
// // //     // DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
// // //     //   CleanCalendarEvent('Event A',
// // //     //       startTime: DateTime(DateTime.now().year, DateTime.now().month,
// // //     //           DateTime.now().day, 10, 0),
// // //     //       endTime: DateTime(DateTime.now().year, DateTime.now().month,
// // //     //           DateTime.now().day, 12, 0),
// // //     //       description: 'A special event',
// // //     //       color: Colors.blue.shade700),
// // //     // ],
// // //     // DateTime(
// // //     //   selectedDateFromFirebase.year,
// // //     //   selectedDateFromFirebase.month,
// // //     //   selectedDateFromFirebase.day,
// // //     //   // DateTime.now().year,
// // //     //   // DateTime.now().month,
// // //     //   // DateTime.now().day,
// // //     // ): [
// // //     //   CleanCalendarEvent(
// // //     //     'Event A',
// // //     //     startTime: DateTime(
// // //     //         selectedDateFromFirebase.year,
// // //     //         selectedDateFromFirebase.month,
// // //     //         selectedDateFromFirebase.day,
// // //     //         12,
// // //     //         0),
// // //     //     endTime: DateTime(
// // //     //         selectedDateFromFirebase.year,
// // //     //         selectedDateFromFirebase.month,
// // //     //         selectedDateFromFirebase.day,
// // //     //         12,
// // //     //         0),
// // //     //   ),
// // //     // ],
// // //   };

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Calnder'),
// // //         centerTitle: true,
// // //       ),
// // //       body: Column(
// // //         mainAxisSize: MainAxisSize.max,
// // //         mainAxisAlignment: MainAxisAlignment.start,
// // //         children: [
// // //           SizedBox(
// // //             height: 400,
// // //             child: Calendar(
// // //               startOnMonday: true,
// // //               weekDays: ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'],
// // //               events: _events,
// // //               onRangeSelected: (range) =>
// // //                   print('Range is ${range.from}, ${range.to}'),
// // //               onDateSelected: (date) => _handleData(date),
// // //               isExpandable: true,
// // //               eventDoneColor: Colors.green,
// // //               selectedColor: Colors.pink,
// // //               todayColor: Colors.blue,
// // //               eventColor: Colors.grey,
// // //               locale: 'de_DE',
// // //               todayButtonText: 'Heute',
// // //               expandableDateFormat: 'EEEE, dd. MMMM yyyy',
// // //               isExpanded: true,
// // //               dayOfWeekStyle: const TextStyle(
// // //                   color: Colors.black,
// // //                   fontWeight: FontWeight.w800,
// // //                   fontSize: 11),
// // //             ),
// // //           ),
// // //           _buildEventList(),
// // //         ],
// // //       ),
// // //       // body: SafeArea(
// // //       //   child: Container(
// // //       //     child: Calendar(
// // //       //       startOnMonday: true,
// // //       //       selectedColor: Colors.blue,
// // //       //       todayColor: Colors.red,
// // //       //       eventColor: Colors.green,
// // //       //       eventDoneColor: Colors.amber,
// // //       //       bottomBarColor: Colors.deepOrange,
// // //       //       onRangeSelected: (range) {
// // //       //         print('selected Dat ${range.from}, ${range.to}');
// // //       //       },
// // //       //       onDateSelected: (date) {
// // //       //         return _handleData(date);
// // //       //       },
// // //       //       events: _events,
// // //       //       isExpanded: true,
// // //       //       dayOfWeekStyle: TextStyle(
// // //       //           fontSize: 15,
// // //       //           color: Colors.black12,
// // //       //           fontWeight: FontWeight.w100),
// // //       //       bottomBarTextStyle: TextStyle(color: Colors.white),
// // //       //       hideBottomBar: false,
// // //       //       hideArrows: false,
// // //       //       weekDays: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
// // //       //     ),
// // //       //   ),
// // //       // ),
// // //     );
// // //   }

// // //   Widget _buildEventList() {
// // //     return Expanded(
// // //       child: StreamBuilder<QuerySnapshot>(
// // //         stream: FirebaseFirestore.instance.collection("services").snapshots(),
// // //         builder: (BuildContext context, snapshot) {
// // //           return ListView.builder(
// // //             shrinkWrap: false,
// // //             physics: NeverScrollableScrollPhysics(),
// // //             padding: EdgeInsets.all(0.0),
// // //             itemBuilder: (BuildContext context, int index) {
// // //               // final CleanCalendarEvent event = selectedEvent![index];
// // //               var gettting =
// // //                   snapshot.data!.docs[index]['selectedDate'].toDate();

// // //               return ListTile(
// // //                 contentPadding: EdgeInsets.only(
// // //                     left: 2.0, right: 8.0, top: 2.0, bottom: 2.0),
// // //                 leading: Container(
// // //                   width: 10.0,
// // //                 ),
// // //                 title: Text(selectedDay == selectedDateFromFirebase
// // //                     ? snapshot.data!.docs[index]['FullName']
// // //                     : ''),
// // //                 // title: Text(event.summary),
// // //                 // subtitle: event.description.isNotEmpty
// // //                 //     ? Text(event.description)
// // //                 //     : null,
// // //                 // trailing: Column(
// // //                 //   mainAxisAlignment: MainAxisAlignment.center,
// // //                 //   children: [Text(start), Text(end)],
// // //                 // ),
// // //                 onTap: () {},
// // //               );
// // //             },
// // //             itemCount: snapshot.data!.docs.length,
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'dart:collection';

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:flutter/material.dart';
// // import 'package:table_calendar/table_calendar.dart';
// // import 'package:wishy/Admin/even.dart';
// // import 'package:wishy/Admin/utils.dart';
// // import 'package:wishy/Config/item.dart';

// // class TableEventsExamplee extends StatefulWidget {
// //   @override
// //   _TableEventsExampleState createState() => _TableEventsExampleState();
// // }

// // DateTime? dateFromFirebase;
// // final _kEventSource = {
// //   FirebaseFirestore.instance.collection("calendar").get().then((value) {
// //     value.docs.forEach((element) {
// //       var ss = element.data()['selected'].toDate();
// //       dateFromFirebase = ss;
// //     });
// //   })
// // };

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:wishy/Admin/adminChat.dart';

// import 'even.dart';

// class TableEventsExample extends StatefulWidget {
//   const TableEventsExample({Key? key}) : super(key: key);

//   @override
//   State<TableEventsExample> createState() => _TableEventsExampleState();
// }

// late DateTime aaa;

// class _TableEventsExampleState extends State<TableEventsExample> {
//   late List selectedEvents;

//   CalendarFormat format = CalendarFormat.month;
//   DateTime selectedDay = DateTime.now();
//   DateTime focusedtDay = DateTime.now();

//   @override
//   void initState() {
//     super.initState();
//     selectedEvents = [DateTime(2022, DateTime.july)];
//   }

//   _getEventsfromDay(DateTime date) {
//     var getting = FirebaseFirestore.instance.collection("calendar").get();
//     getting.then((value) {
//       var ele = value.docs.forEach((element) {
//         DateTime eeeee = element.data()['selected'].toDate();
//         var ss = selectedEvents.add(aaa.day);

//         aaa = eeeee;

//         // DateTime? toDateTime = DateTimele;
//         // DateTime? dateee = DateTime(2022, 07, 20);

//         // date = dateee;

//         // setState(() {
//         //   date;
//         // });
//         print("Date From Firebase ${aaa.day}");
//         print("Date From Selected ${selectedDay.day}");
//       });
//     });
//     return aaa;
//     // return selectedEvents[date] ?? [];
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     // selectedDay.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Calendar"),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           TableCalendar(
//             focusedDay: selectedDay,
//             firstDay: DateTime(1990),
//             lastDay: DateTime(2050),
//             calendarFormat: format,
//             onFormatChanged: (CalendarFormat _format) {
//               setState(() {
//                 format = _format;
//               });
//             },
//             startingDayOfWeek: StartingDayOfWeek.monday,
//             daysOfWeekVisible: true,
//             // Day Changed
//             onDaySelected: (DateTime selectDat, DateTime focusDat) {
//               setState(() {
//                 selectedDay = selectDat;
//                 focusedtDay = focusDat;
//               });
//             },
//             selectedDayPredicate: (DateTime aaa) {
//               return isSameDay(selectedDay, aaa);
//             },
//             eventLoader: ss,
//             // Style the calender
//             calendarStyle: CalendarStyle(
//               isTodayHighlighted: true,
//             ),

//             headerStyle: const HeaderStyle(
//                 formatButtonVisible: true,
//                 titleCentered: true,
//                 formatButtonShowsNext: false),
//           ),
//           // ..._getEventsfromDay(selectedDay).map((Event event) => ListTile(
//           //       title: Text("asf"),
//           //     )),
//           _buildEventList(),
//         ],
//       ),
//     );
//   }

//   Widget _buildEventList() {
//     // setState(() {
//     //   selectedDay.day;
//     //   aaa.day;
//     // });
//     return Expanded(
//       child: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection("calendar")
//             // .where("selectedDate", isEqualTo: selectedDay.day)
//             .snapshots(),
//         builder: (BuildContext context, snapshot) {
//           return ListView.builder(
//             shrinkWrap: false,
//             physics: NeverScrollableScrollPhysics(),
//             padding: EdgeInsets.all(2.0),
//             itemBuilder: (BuildContext context, int index) {
//               // final CleanCalendarEvent event = selectedEvent![index];
//               var gettting = snapshot.data!.docs[index]['selected'].toDate();
//               var gettingDay = gettting.day;
//               var gettingMonth = gettting.month;
//               if (selectedDay.day == gettingDay &&
//                   selectedDay.month == gettingMonth) {
//                 // return ListTile(
//                 //   title: Text(snapshot.data!.docs[index]['name']),
//                 //   subtitle: Text(snapshot.data!.docs[index]['phoneNumber']),
//                 //   // title: Text(event.summary),
//                 //   // subtitle: event.description.isNotEmpty
//                 //   //     ? Text(event.description)
//                 //   //     : null,
//                 //   // trailing: Column(
//                 //   //   mainAxisAlignment: MainAxisAlignment.center,
//                 //   //   children: [Text(start), Text(end)],
//                 //   // ),
//                 // );
//                 return ListTile(
//                   leading: CircleAvatar(
//                     backgroundColor: Colors.purple,
//                     child: Text(snapshot.data!.docs.length.toString()),
//                   ),
//                   tileColor: Colors.white70,
//                   title: Text(snapshot.data!.docs[index]['name']),
//                   subtitle: Text(snapshot.data!.docs[index]['name']),
//                   trailing: ElevatedButton(
//                     onPressed: () {},
//                     child: Text("Mark as Done"),
//                   ),
//                 );
//               } else {
//                 return Container();
//               }

//               // return ListTile(
//               //   title: selectedDay.day == ss
//               //       ? Text(snapshot.data!.docs[index]['FullName'])
//               //       : null,
//               //   // title: Text(event.summary),
//               //   // subtitle: event.description.isNotEmpty
//               //   //     ? Text(event.description)
//               //   //     : null,
//               //   // trailing: Column(
//               //   //   mainAxisAlignment: MainAxisAlignment.center,
//               //   //   children: [Text(start), Text(end)],
//               //   // ),
//               //   onTap: () {},
//               // );
//             },
//             itemCount: snapshot.data!.docs.length,
//           );
//         },
//       ),
//     );
//   }
// }

// class _TableEventsExampleState extends State<TableEventsExamplee> {
//   late final ValueNotifier<List<Event>> _selectedEvents;
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
//       .toggledOff; // Can be toggled on/off by longpressing a date
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//   DateTime? _rangeStart;
//   DateTime? _rangeEnd;

//   final kEvents = LinkedHashMap<DateTime, List<Event>>(
//     equals: isSameDay,
//     hashCode: getHashCode,
//   )..addAll(_kEventSource);

//   // _getEventsfromDay(DateTime date) {
//   //   var getting = FirebaseFirestore.instance.collection("calendar").get();
//   //   getting.then((value) {
//   //     var ele = value.docs.forEach((element) {
//   //       DateTime eeeee = element.data()['selected'].toDate();
//   //       var ss = selectedEvents.add(selectedDay);

//   //       aaa = eeeee;

//   //       // DateTime? toDateTime = DateTimele;
//   //       // DateTime? dateee = DateTime(2022, 07, 20);

//   //       // date = dateee;

//   //       // setState(() {
//   //       //   date;
//   //       // });
//   //       print("Date From Firebase ${aaa.day}");
//   //       print("Date From Selected ${selectedDay.day}");
//   //     });
//   //   });
//   //   return aaa;
//   //   // return selectedEvents[date] ?? [];
//   // }

//   @override
//   void initState() {
//     super.initState();

//     _selectedDay = _focusedDay;
//     _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
//   }

//   @override
//   void dispose() {
//     _selectedEvents.dispose();
//     super.dispose();
//   }

//   List<Event> _getEventsForDay(DateTime day) {
//     // Implementation example
//     return kEvents[day] ?? [];
//   }

//   List<Event> _getEventsForRange(DateTime start) {
//     // Implementation example
//     final days = daysInRange(start);

//     return [
//       for (final d in days!) ..._getEventsForDay(start),
//     ];
//   }

//   void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     if (!isSameDay(_selectedDay, selectedDay)) {
//       setState(() {
//         _selectedDay = selectedDay;
//         _focusedDay = focusedDay;
//         _rangeStart = null; // Important to clean those
//         _rangeEnd = null;
//         _rangeSelectionMode = RangeSelectionMode.toggledOff;
//       });

//       _selectedEvents.value = _getEventsForDay(selectedDay);
//     }
//   }

//   void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
//     setState(() {
//       _selectedDay = null;
//       _focusedDay = focusedDay;
//       _rangeStart = start;
//       _rangeEnd = end;
//       _rangeSelectionMode = RangeSelectionMode.toggledOn;
//     });

//     // `start` or `end` could be null
//     if (start != null && end != null) {
//       _selectedEvents.value = _getEventsForRange(start);
//     } else if (start != null) {
//       _selectedEvents.value = _getEventsForDay(start);
//     } else if (end != null) {
//       _selectedEvents.value = _getEventsForDay(end);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('TableCalendar - Events'),
//       ),
//       body: Column(
//         children: [
//           TableCalendar<Event>(
//             firstDay: kFirstDay,
//             lastDay: DateTime(2050),
//             focusedDay: _focusedDay,
//             selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//             rangeStartDay: _rangeStart,
//             rangeEndDay: _rangeEnd,
//             calendarFormat: _calendarFormat,
//             rangeSelectionMode: _rangeSelectionMode,
//             eventLoader: _getEventsForDay,
//             startingDayOfWeek: StartingDayOfWeek.monday,
//             calendarStyle: CalendarStyle(
//               // Use `CalendarStyle` to customize the UI
//               outsideDaysVisible: false,
//             ),
//             onDaySelected: _onDaySelected,
//             onRangeSelected: _onRangeSelected,
//             onFormatChanged: (format) {
//               if (_calendarFormat != format) {
//                 setState(() {
//                   _calendarFormat = format;
//                 });
//               }
//             },
//             onPageChanged: (focusedDay) {
//               _focusedDay = focusedDay;
//             },
//           ),
//           const SizedBox(height: 8.0),
//           Expanded(
//             child: ValueListenableBuilder<List<Event>>(
//               valueListenable: _selectedEvents,
//               builder: (context, value, _) {
//                 return ListView.builder(
//                   itemCount: value.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       margin: const EdgeInsets.symmetric(
//                         horizontal: 12.0,
//                         vertical: 4.0,
//                       ),
//                       decoration: BoxDecoration(
//                         border: Border.all(),
//                         borderRadius: BorderRadius.circular(12.0),
//                       ),
//                       child: ListTile(
//                         onTap: () => print('${value[index]}'),
//                         title: Text('${value[index]}'),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
