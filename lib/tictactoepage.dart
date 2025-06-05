import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TicTacToePage extends StatefulWidget {
  const TicTacToePage({super.key});

  @override
  State<TicTacToePage> createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  bool ohTurn = true;
  List<String> displayEx = ['', '', '', '', '', '', '', '', ''];
  var myStyle = const TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold);
  int Xscore = 0;
  int Oscore = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tic Tac Toe')),
      body: Column(
        children: [Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Text('Player O', style: myStyle),
                      Text(Oscore.toString(), style: myStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Text('Player X', style: myStyle),
                      Text(Xscore.toString(), style: myStyle),
                    ],
                  ),
                ),

              ]
            )
        ),
          Expanded(
            flex: 4,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },

                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Center(
                      child: Text(
                        displayEx[index],
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && displayEx[index] == '') {
        displayEx[index] = 'X';
      } else if (!ohTurn && displayEx[index] == '') {
        displayEx[index] = 'O';
      }
      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    // Row 1
    if (displayEx[0] == displayEx[1] &&
        displayEx[0] == displayEx[2] &&
        displayEx[0] != '') {
      _showWinDialog(displayEx[0]);
    }
    // Row 2
    else if (displayEx[3] == displayEx[4] &&
        displayEx[3] == displayEx[5] &&
        displayEx[3] != '') {
      _showWinDialog(displayEx[3]);
    }
    // Row 3
    else if (displayEx[6] == displayEx[7] &&
        displayEx[6] == displayEx[8] &&
        displayEx[6] != '') {
      _showWinDialog(displayEx[6]);
    }
    // Column 1
    else if (displayEx[0] == displayEx[3] &&
        displayEx[0] == displayEx[6] &&
        displayEx[0] != '') {
      _showWinDialog(displayEx[0]);
    }
    // Column 2
    else if (displayEx[1] == displayEx[4] &&
        displayEx[1] == displayEx[7] &&
        displayEx[1] != '') {
      _showWinDialog(displayEx[1]);
    }
    // Column 3
    else if (displayEx[2] == displayEx[5] &&
        displayEx[2] == displayEx[8] &&
        displayEx[2] != '') {
      _showWinDialog(displayEx[2]);
    }
    // Diagonal 1
    else if (displayEx[0] == displayEx[4] &&
        displayEx[0] == displayEx[8] &&
        displayEx[0] != '') {
      _showWinDialog(displayEx[0]);
    }
    // Diagonal 2
    else if (displayEx[2] == displayEx[4] &&
        displayEx[2] == displayEx[6] &&
        displayEx[2] != '') {
      _showWinDialog(displayEx[2]);
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(title: Text('Winner is: $winner'),
            actions: <Widget>[
              Center(
                child: TextButton(onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                }, child: const Text('Play Again')),
              )
            ]
        );
      },
    );
    if (winner == 'X') {
      Xscore += 1;
    } else if (winner == 'O') {
      Oscore += 1;
    }
  }
  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayEx[i] = '';
      }
    });
  }
}

