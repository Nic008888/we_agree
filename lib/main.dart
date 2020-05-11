import 'package:flutter/material.dart';
import 'my_home_page_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'You Choose or Decision Match',
      theme: ThemeData(
        primaryColor: Color(0xFF00BCD4),
        primaryColorDark: Color(0xFF0097A7),
        primaryColorLight: Color(0xffB2EBF2),
        accentColor: Color(0xFFFF5722),
        dividerColor: Color(0xFFBDBDBD),
        secondaryHeaderColor: Color(0xFF757575),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      home: MyHomePage(),
    );
  }
}

