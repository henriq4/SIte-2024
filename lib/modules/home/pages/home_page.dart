import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suap_uenp_app/modules/calendar/pages/calendar_page.dart';
import 'package:suap_uenp_app/modules/perfil/pages/perfil_page.dart';

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
      body: PageView(
        controller: pageController,
        children: [
          Center(
            child: Text("HOME"),
          ),
          CalendarPage(),
          PerfilPage(),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: pageController,
        builder: (context, child) {
          return BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: pageController.page?.round() ?? 0,
            onTap: (index) => {
              pageController.jumpToPage(index),
              Modular.to.navigate(index == 0
                  ? '/'
                  : index == 1
                      ? '/calendar'
                      : '/perfil'),
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.mark_chat_read),
                label: 'Matérias',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Perfil',
              ),
            ],
          );
        },
      ),
    );
  }
}
