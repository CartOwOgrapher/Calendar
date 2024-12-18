import 'package:flutter/material.dart';
import 'calendar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _currentDate = DateTime.now();

  void _changeMonth(int i) {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month + i, 1);
    });
  }

  void _changeYear(int i) {
    setState(() {
      _currentDate = DateTime(_currentDate.year + i, _currentDate.month, 1);
    });
  }

  void _resetToToday() {
    setState(() {
      _currentDate = DateTime.now();
    });
  }

  String getMonthName(int month) {
    const months = [
      'Январь',
      'Февраль',
      'Март',
      'Апрель',
      'Май',
      'Июнь',
      'Июль',
      'Август',
      'Сентябрь',
      'Октябрь',
      'Ноябрь',
      'Декабрь',
    ];
    return months[month - 1];
  }

  String getMonthAndYear(DateTime date) {
    return '${getMonthName(date.month)} ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final String currentMonth = getMonthAndYear(_currentDate);

    return Scaffold(
      appBar: AppBar(title: const Text('Calendar')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => _changeMonth(-1),
                ),
                Column(
                  children: [
                    Text(
                      currentMonth,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.keyboard_arrow_up),
                          onPressed: () => _changeYear(1),
                        ),
                        IconButton(
                          icon: const Icon(Icons.keyboard_arrow_down),
                          onPressed: () => _changeYear(-1),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () => _changeMonth(1),
                ),
              ],
            ),
          ),
          Expanded(
            child: CalendarWidget(currentDate: _currentDate),
          ),
          if (_currentDate.month != DateTime.now().month ||
              _currentDate.year != DateTime.now().year)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _resetToToday,
                child: const Text('Вернуться к текущему месяцу'),
              ),
            ),
        ],
      ),
    );
  }
}
