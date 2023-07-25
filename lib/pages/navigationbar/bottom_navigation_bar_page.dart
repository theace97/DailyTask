import 'package:flutter/material.dart';
import 'package:daily_tasks/pages/hometask/hometask_page.dart';
import 'package:daily_tasks/pages/profile/profile_page.dart';
import 'package:daily_tasks/pages/welcome/welcome_page.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarPage> createState() => _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int _pageSelectedIndex = 0;

  List<Widget> _bottomNavigationBarWidgets = <Widget>[
    HomePage(),
    HomeTaskPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _bottomNavigationBarWidgets.elementAt(_pageSelectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profil",
          ),
        ],
        currentIndex: _pageSelectedIndex,
        selectedItemColor: _selectedItemColor(),
        onTap: _onItemSelected,
      ),
    );
  }

  void _onItemSelected(int index) {
    setState(() {
      _pageSelectedIndex = index;
    });
  }

  Color _selectedItemColor() {
    if (_pageSelectedIndex == 0) {
      return Colors.blue;
    } else if (_pageSelectedIndex == 1) {
      return Colors.pinkAccent;
    } else {
      return Colors.deepPurpleAccent;
    }
  }
}