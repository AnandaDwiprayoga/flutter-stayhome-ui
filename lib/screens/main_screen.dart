import 'package:flutter/material.dart';
import 'favorite_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndexPage = 0;

  final List<Widget> _listPage = [
    HomeScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listPage[_currentIndexPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _currentIndexPage = index;
          });
        },
        currentIndex: _currentIndexPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.home,
              size: 24,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.list,
              size: 24,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/gambar/profile.jpg'),
            ),
            title: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
