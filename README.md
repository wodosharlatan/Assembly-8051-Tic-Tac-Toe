# 8051 Assembly Tic Tac Toe Documentation
Introduction

This assembly code is written for 8051 microcontroller and implements a Tic Tac Toe game logic.
## Memory Usage

The code uses several memory locations to store values for game variables and flags. Some of the memory locations used in this code are:

    R1: Used to store the value of the game board position being currently checked
    R2: Used to store the number of iterations for the game board reset loop
    70h: Used to store the value of the player's turn
    P1, P2, P3: Used to store the values of the game board
    P0: Used to store the status of the game and which player has won

## Game Loop

The game logic is implemented in a loop that starts with the MainLoop label. The loop checks the game board (stored in P1, P2, and P3) for a winning condition. If no winning condition is met, the code continues to the next iteration of the loop.
Winning Conditions

The code checks for 8 possible winning conditions for both players (player 1 and player 2). The winning conditions are checked in the following sequence:

## The winning conditions are checked in the following sequence:


    1. Top Row: (A1, A2, A3)
    2. Middle Row: (B1, B2, B3)
    3. Bottom Row: (C1, C2, C3)
    4. Left Column: (A1, B1, C1)
    5. Middle Column: (A2, B2, C2)
    6. Right Column: (A3, B3, C3)
    7. Left-to-Right Diagonal: (A1, B2, C3)
    8. Right-to-Left Diagonal: (A3, B2, C1)


If a winning condition is met, the code jumps to the label Player1Victorious or Player2Victorious to set the appropriate flag in P0 to indicate which player has won.
Resetting the Game Board

The game board is reset at the beginning of each game iteration. The code resets all positions on the game board to 0.
Game Play

The game play is implemented in the section of code starting with the label SETB P0.0. Here, the code sets flags in P0 to indicate the player's turn and allows players to make their moves by setting values in P1, P2, and P3.
## Conclusion

### This code implements the Tic Tac Toe game logic and allows two players to play the game on an 8051 microcontroller. The code uses several memory locations to store values for game variables and flags and implements a loop to check for winning conditions.
