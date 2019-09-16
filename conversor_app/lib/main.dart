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
        primaryColor: Colors.purple[500],
        accentColor: Colors.white,
      ),
      home: Home(),
    );
  }
}
