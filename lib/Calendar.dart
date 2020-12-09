import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController _controller;
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
                initialCalendarFormat: CalendarFormat.month,
                calendarStyle: CalendarStyle(
                    todayColor: Colors.pinkAccent, selectedColor: Colors.green),
                calendarController: _controller,
                headerStyle: HeaderStyle(
                    centerHeaderTitle: true,
                    formatButtonDecoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20.0)),
                    formatButtonTextStyle: TextStyle(color: Colors.white),
                    formatButtonShowsNext: false),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                startingDayOfWeek: StartingDayOfWeek.sunday,
                weekendDays: [
                  DateTime.saturday,
                ]),
          ],
        ),
      ),
    );
  }
}
