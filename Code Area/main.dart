import 'package:flutter/material.dart';
import 'ui/home_page.dart';

String title = "Tic Tac Toe";

void main() => runApp(TicTacToe());

class TicTacToe extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: HomePage(title: title),
    );
  }
}