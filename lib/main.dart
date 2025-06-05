import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/tictactoepage.dart';

void main() => runApp(const tictactoe());

class tictactoe extends StatelessWidget {
  const tictactoe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TicTacToePage(),
    );
  }
}
