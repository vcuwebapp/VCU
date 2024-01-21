import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vcu_2023/custom_widgets/custom_parent_widget.dart';
import 'package:vcu_2023/globals/common_functions.dart';
import 'package:vcu_2023/globals/common_variables.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => AttendanceState();
}

class AttendanceState extends State<Attendance> {
  late Future attendanceHistoryFuture;
  DateTime userSelectedDay = DateTime.now();
  List<Map<String, dynamic>> records = [];
  Map<DateTime, List<dynamic>> _events = {};

  List<DateTime> toHighlight = [];
  DateTime todaysDateTime = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  void onDayTap(DateTime day, DateTime focusedDay) async {
    if (day.day == DateTime.now().day &&
        day.month == DateTime.now().month &&
        day.year == DateTime.now().year) {
      if (await checkAutoDateTime()) {
        //TODO: open camera ontap.
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _events = {};
    attendanceHistoryFuture = getData();
  }

  ///Sorting data to highlight the dates which are present in peopleeventlog data.
  getData() async {
    toHighlight.clear();
    records = await getAttendanceRecords();
    setState(() {
      if (records.isNotEmpty) {
        String dateFor = records[0]['datefor'];
        toHighlight.add(DateTime.parse(dateFor));
        List pel = [];
        for (int i = 0; i < records.length; i++) {
          if (dateFor == records[i]['datefor']) {
            pel.add(records[i]);
          } else {
            final record = <DateTime, List<dynamic>>{
              DateTime.parse(dateFor): pel,
            };
            _events.addEntries(record.entries);
            dateFor = records[i]['datefor'];
            toHighlight.add(DateTime.parse(dateFor));
            pel.clear();
          }
        }
      }
    });
  }

  ///Requests the getAttendanceHostory() service and parses the data to add in the list of records.
  Future<List<Map<String, dynamic>>> getAttendanceRecords() async {
    List<Map<String, dynamic>> records = [];
    try {
      //TODO: request fro attendance records.
    } catch (e) {
      debugPrint('getAttendanceRecords $e');
    }

    return records;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
      ),
      body: CustomParentWidget(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FutureBuilder(
                future: attendanceHistoryFuture,
                builder: (context, snapshot) {
                  return Card(
                    child: TableCalendar(
                      weekendDays: const [],
                      daysOfWeekHeight: 40,
                      firstDay: DateTime.parse('2024-01-01 00:00:00'),
                      lastDay: todaysDateTime,
                      focusedDay: DateTime.now(),
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        headerPadding: EdgeInsets.all(16),
                      ),
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      daysOfWeekStyle: const DaysOfWeekStyle(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: kWhiteColor, width: 2),
                                top: BorderSide(color: kWhiteColor, width: 2))),
                        weekendStyle: TextStyle(color: kPrimaryColor),
                        weekdayStyle: TextStyle(color: kPrimaryColor),
                      ),
                      calendarBuilders: CalendarBuilders(
                        prioritizedBuilder: (context, day, focusedDay) {
                          for (DateTime d in toHighlight) {
                            if (day.day == d.day &&
                                day.month == d.month &&
                                day.year == d.year) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade300,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${day.day}',
                                      style: const TextStyle(
                                        color: kWhiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          }
                          if (day.isBefore(todaysDateTime)) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red.shade300,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '${day.day}',
                                    style: const TextStyle(color: kWhiteColor),
                                  ),
                                ),
                              ),
                            );
                          }

                          return null;
                        },
                      ),
                      onDaySelected: (DateTime selectDay, DateTime focusDay) {
                        onDayTap(selectDay, focusDay);
                      },
                      selectedDayPredicate: (DateTime date) {
                        return isSameDay(userSelectedDay, date);
                      },
                    ),
                  );
                },
              ),
              Row(
                children: [
                  showLables('Present', Colors.green.shade300),
                  showLables('Absent', Colors.red.shade300),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///Widget to show the labels.
  Padding showLables(String labelText, Color labelColor) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(
            Icons.square_rounded,
            size: 15,
            color: labelColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(labelText),
        ],
      ),
    );
  }
}
