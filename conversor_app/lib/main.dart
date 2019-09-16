import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Conversor de moedas',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          fillColor: Colors.black54,
          filled: true,
          labelStyle: TextStyle(
            fontSize: 18,
            color: Colors.white54,
          ),
          prefixStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        textTheme: TextTheme(
          subhead: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        primaryColor: Colors.purple[500],
        accentColor: Colors.white,
      ),
      home: Home(),
    );
  }
}
