import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tictactoepage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C3E50), // Dark blue background
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C3E50),
        elevation: 0,
        title: Center(
          child: Text(
            'Tic Tac Toe',
            style: GoogleFonts.pressStart2p(
              textStyle: const TextStyle(
                fontSize: 24,
                color: Color(0xFFE74C3C), // Red text
                shadows: [
                  Shadow(
                    color: Colors.white24,
                    offset: Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xFF2C3E50), const Color(0xFF34495E)],
          ),
        ),
        child: Center(
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
                      color: const Color(0xFFE74C3C),
                      offset: const Offset(0, 0),
                      blurRadius: 20,
                      spreadRadius: 10,
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
                  backgroundColor: const Color(0xFFE74C3C),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 30,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  elevation: 8,
                  shadowColor: const Color(0xFFE74C3C),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TicTacToePage(),
                    ),
                  );
                },
                child: Text(
                  'Start GAME',
                  style: GoogleFonts.pressStart2p(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      letterSpacing: 2,
                      shadows: [
                        Shadow(
                          color: Colors.black26,
                          offset: Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
