import 'package:flutter/material.dart';

class CalendarWidget extends StatelessWidget {
  final DateTime currentDate;

  const CalendarWidget({Key? key, required this.currentDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int daysInMonth =
        DateTime(currentDate.year, currentDate.month + 1, 0).day;
    final DateTime firstDayOfMonth =
        DateTime(currentDate.year, currentDate.month, 1);
    final int firstWeekday = firstDayOfMonth.weekday;
    final List<Widget> days = [];

    const List<String> weekdays = ['пн', 'вт', 'ср', 'чт', 'пт', 'сб', 'вс'];

    for (String day in weekdays) {
      days.add(Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(4),
        child: Text(
          day,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ));
    }

    for (int i = 0; i < firstWeekday - 1; i++) {
      days.add(const SizedBox());
    }

    for (int i = 1; i <= daysInMonth; i++) {
      final bool isToday = currentDate.year == DateTime.now().year &&
          currentDate.month == DateTime.now().month &&
          i == DateTime.now().day;

      days.add(Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isToday ? Colors.red : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        alignment: Alignment.center,
        child: Text(
          '$i',
          style: TextStyle(
            color: isToday ? Colors.white : Colors.black,
            fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ));
    }

    return GridView.count(
      crossAxisCount: 7,
      children: days,
    );
  }
}
