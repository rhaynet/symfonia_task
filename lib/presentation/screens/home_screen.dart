import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:symfonia_test/presentation/widgets/custom_icon.dart';
import 'package:symfonia_test/presentation/widgets/custom_notificaton_icon.dart';

import 'history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pages = <Widget>[
    const HistoryScreen(),
    const Center(child: Text('Page not found')),
    const Center(child: Text('Page not found')),
    const Center(child: Text('Page not found')),
  ];

  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: CustomIcon(
              icon: const Icon(Icons.bar_chart_outlined),
              color: _selectedIndex == 0 ? Colors.black : Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CustomIcon(
              icon: const Icon(FontAwesomeIcons.globe),
              color: _selectedIndex == 1 ? Colors.black : Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CustomIcon(
              icon: const CustomNotificationIcon(),
              color: _selectedIndex == 2 ? Colors.black : Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CustomIcon(
              icon: const Icon(Icons.person_outlined),
              color: _selectedIndex == 3 ? Colors.black : Colors.white,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTap,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
      ),
    );
  }
}
