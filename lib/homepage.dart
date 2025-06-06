import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tictactoepage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        backgroundColor: Colors.grey[500],
        elevation: 0,
        title: Center(
          child: Text(
            'Tic Tac Toe',
            style: GoogleFonts.pressStart2p(
              textStyle: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Glowing Circle Avatar
            Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white70,
                    offset: const Offset(0, 0),
                    blurRadius: 10,
                    spreadRadius: 20,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 120,
                backgroundColor: Colors.black,
                backgroundImage: AssetImage(
                  'assets/images/istockphoto-1149177366-612x612.jpg',
                ),
              ),
            ),

            const SizedBox(height: 100),

            // Start GAME button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[700],
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TicTacToePage()),
                );
              },
              child: Text(
                'Start GAME',
                style: GoogleFonts.pressStart2p(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
