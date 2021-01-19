import 'package:flutter/material.dart';
import 'package:todart_app/constants.dart';
import 'screens/login/login.dart';

void main() => runApp(TodartApp());

class TodartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todart',
      home: Login(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: kPrimaryColor),
    );
  }
}
