import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
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
                  'Recente',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Card.filled(
                        child: SizedBox(
                          height: 120,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card.filled(
                        child: SizedBox(
                          height: 120,
                        ),
                      ),
                    ),
                  ],
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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Notícias',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                Card.filled(
                  child: SizedBox(
                    width: double.infinity,
                    height: 160,
                  ),
                ),
                Card.filled(
                  child: SizedBox(
                    width: double.infinity,
                    height: 160,
                  ),
                ),
                Card.filled(
                  child: SizedBox(
                    width: double.infinity,
                    height: 160,
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
