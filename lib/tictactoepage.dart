import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicTacToePage extends StatefulWidget {
  const TicTacToePage({super.key});

  @override
  State<TicTacToePage> createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  bool ohTurn = true;
  List<String> displayEx = ['', '', '', '', '', '', '', '', ''];
  var myStyle = const TextStyle(
    color: Colors.black,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  int Xscore = 0;
  int Oscore = 0;
  int filledBoxes = 0;

  var myNewFont = GoogleFonts.pressStart2p(
    textStyle: const TextStyle(color: Colors.black, letterSpacing: 3),
  );

  var myNewFontWhite = GoogleFonts.pressStart2p(
    textStyle: const TextStyle(
      color: Colors.white,
      letterSpacing: 3,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe' , style: TextStyle(fontSize: 30),),
        backgroundColor: Colors.grey[900],
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: GoogleFonts.pressStart2p(
          textStyle: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1F1F1F), // dark gray
              Color(0xFF121212),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Player O', style: myNewFontWhite),
                        const SizedBox(height: 10),
                        Text(Oscore.toString(), style: myNewFontWhite),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Player X', style: myNewFontWhite),
                        const SizedBox(height: 10),
                        Text(Xscore.toString(), style: myNewFontWhite),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white70, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(2, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          displayEx[index],
                          style: TextStyle(
                            fontSize: 40,
                            color: displayEx[index] == 'X'
                                ? Colors.redAccent
                                : Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'PressStart2P',
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && displayEx[index] == '') {
        displayEx[index] = 'X';
        filledBoxes += 1;
      } else if (!ohTurn && displayEx[index] == '') {
        displayEx[index] = 'O';
        filledBoxes += 1;
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
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('DRAW !!'),
          actions: <Widget>[
            Center(
              child: TextButton(
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: const Text('Play Again'),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showWinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Winner is: $winner'),
          actions: <Widget>[
            Center(
              child: TextButton(
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: const Text('Play Again'),
              ),
            ),
          ],
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
      filledBoxes = 0;
    });
  }
}
