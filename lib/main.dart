import 'package:flutter/material.dart';
import 'package:submission_pemula/screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StayHome',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
