import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'even.dart';

class TableEventsExample extends StatefulWidget {
  const TableEventsExample({Key? key}) : super(key: key);

  @override
  State<TableEventsExample> createState() => _TableEventsExampleState();
}

late DateTime aaa;

class _TableEventsExampleState extends State<TableEventsExample> {
  late Map<DateTime, List<Event>> selectedEvents;

  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedtDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    selectedEvents = {};
  }

  List<Event> _getEventsfromDay(DateTime date) {
    var getting = FirebaseFirestore.instance.collection("calendar").get();
    getting.then((value) {
      var ele = value.docs.forEach((element) {
        DateTime eeeee = element.data()['selected'].toDate();

        aaa = eeeee;

        // DateTime? toDateTime = DateTimele;
        // DateTime? dateee = DateTime(2022, 07, 20);

        // date = dateee;

        // setState(() {
        //   date;
        // });
        print("Date From Firebase ${aaa.day}");
        print("Date From Selected ${selectedDay.day}");
      });
    });
    return selectedEvents[selectedDay.day] ?? [];
    // return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    super.dispose();
    // selectedDay.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendar"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekVisible: true,
            // Day Changed
            onDaySelected: (DateTime selectDat, DateTime focusDat) {
              setState(() {
                selectedDay = selectDat;
                focusedtDay = focusDat;
              });
            },
            selectedDayPredicate: (DateTime aaa) {
              return isSameDay(selectedDay, aaa);
            },
            eventLoader: _getEventsfromDay,
            // Style the calender
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
            ),

            headerStyle: const HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
                formatButtonShowsNext: false),
          ),
          // ..._getEventsfromDay(selectedDay).map((Event event) => ListTile(
          //       title: Text("asf"),
          //     )),
          _buildEventList(),
        ],
      ),
    );
  }

  Widget _buildEventList() {
    // setState(() {
    //   selectedDay.day;
    //   aaa.day;
    // });
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("calendar")
            // .where("selectedDate", isEqualTo: selectedDay.day)
            .snapshots(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: false,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(2.0),
              itemBuilder: (BuildContext context, int index) {
                // final CleanCalendarEvent event = selectedEvent![index];
                var gettting = snapshot.data!.docs[index]['selected'].toDate();
                var gettingDay = gettting.day;
                var gettingMonth = gettting.month;
                var CurrentId = snapshot.data!.docs[index].id;
                if (selectedDay.day == gettingDay &&
                    selectedDay.month == gettingMonth) {
                  // return ListTile(
                  //   title: Text(snapshot.data!.docs[index]['name']),
                  //   subtitle: Text(snapshot.data!.docs[index]['phoneNumber']),
                  //   // title: Text(event.summary),
                  //   // subtitle: event.description.isNotEmpty
                  //   //     ? Text(event.description)
                  //   //     : null,
                  //   // trailing: Column(
                  //   //   mainAxisAlignment: MainAxisAlignment.center,
                  //   //   children: [Text(start), Text(end)],
                  //   // ),
                  // );
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple,
                      child: Text(snapshot.data!.docs.length.toString()),
                    ),
                    tileColor: Colors.white70,
                    title: Text(snapshot.data!.docs[index]['name']),
                    subtitle: Text(snapshot.data!.docs[index]['name']),
                    trailing: ElevatedButton(
                      onPressed: () {
                        deleteingDate(CurrentId);
                      },
                      child: Text("Mark as Done"),
                    ),
                  );
                } else {
                  return Container();
                }

                // return ListTile(
                //   title: selectedDay.day == ss
                //       ? Text(snapshot.data!.docs[index]['FullName'])
                //       : null,
                //   // title: Text(event.summary),
                //   // subtitle: event.description.isNotEmpty
                //   //     ? Text(event.description)
                //   //     : null,
                //   // trailing: Column(
                //   //   mainAxisAlignment: MainAxisAlignment.center,
                //   //   children: [Text(start), Text(end)],
                //   // ),
                //   onTap: () {},
                // );
              },
              itemCount: snapshot.data!.docs.length,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future deleteingDate(String currentId) async {
    await FirebaseFirestore.instance
        .collection("calendar")
        .doc(currentId)
        .delete();
    print("ID ID is $currentId");
  }
}
