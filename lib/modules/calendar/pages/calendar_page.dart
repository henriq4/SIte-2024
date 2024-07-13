import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendário'),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Calendário',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                Card.filled(
                  child: SizedBox(
                    width: double.infinity,
                    height: 200,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Avalicações',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                Card.filled(
                  child: SizedBox(
                    width: double.infinity,
                    height: 80,
                  ),
                ),
                Card.filled(
                  child: SizedBox(
                    width: double.infinity,
                    height: 80,
                  ),
                ),
                Card.filled(
                  child: SizedBox(
                    width: double.infinity,
                    height: 80,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
