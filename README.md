# Tic Tac Toe Flutter App

![App Screenshot]![Screenshot from 2025-06-06 14-47-05](https://github.com/user-attachments/assets/6cb5c784-114c-4dfd-b692-597996b7cf9f)


A classic Tic Tac Toe game built with Flutter, featuring player vs player functionality with win detection and score tracking.

## Features

🎮 **Two-Player Game**: Play against a friend on the same device  
🏆 **Score Tracking**: Keeps count of wins for both players (X and O)  
🔍 **Win Detection**: Automatically detects winning patterns  
🤝 **Draw Recognition**: Identifies when the game ends in a draw  
🔄 **Play Again**: Quick restart after each game  
📱 **Responsive Design**: Works on mobile, tablet, and web  

## Screenshots

| Game Start | Mid Game | Game Win | Game Draw |
|------------|----------|----------|-----------|
| ![Start Screen](https://github.com/user-attachments/assets/08dfaa2e-f4a3-41d0-b199-2f0d46553db8) | ![Mid Game](https://github.com/user-attachments/assets/a2a18c12-aa1c-4694-85c3-fdbb5011c225) | ![Win Screen](https://github.com/user-attachments/assets/e3fbe267-9f15-4e19-8a94-9cd8c0982c76) | ![Draw Screen](https://github.com/user-attachments/assets/a1776470-691d-4165-830b-af42cb92471b) |

## How to Play

1. Tap "Start Game" to begin
2. Player X always goes first
3. Alternate turns by tapping empty squares
4. The game automatically:
   - Detects wins (3 in a row horizontally, vertically, or diagonally)
   - Announces draws when all squares are filled
   - Updates player scores
5. Tap "Play Again" to start a new round

## Installation

```bash
# Clone the repository
git clone https://github.com/mehnafiz/tic_tac_toe.git

# Navigate to project directory
cd tic_tac_toe

# Install dependencies
flutter pub get

# Run the app
flutter run
