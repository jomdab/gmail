import 'package:flutter/material.dart';
import 'package:gmail/home_screen.dart';

void main() {
  runApp(GmailApp());
}

class GmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail App',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.red,
      // ),
      home: HomeScreen(),
    );
  }
}
