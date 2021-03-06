// Assignment1.cpp : CSC 309-901 Spring 2018
// By: Joseph "Joey" Darroch

#include "stdafx.h"						// Apparently I have to include this or else Visual Studio has rendering issues?
#include <iostream>						// For input/output
#include <ctime>						// Used to help us initialize seeding for the game
#include <cstdlib>						// Gives us the rand and srand functions necessary for gameplay
#include <sstream>						// Gives access to stringstream, used to filter user input in a simple fashion

using namespace std;					// So that I can be lazy with input/output from/to console

string input;							// Global variable so I don't have to create a new one within each method

int playGame(bool demo) {				// A separate method for playing the game so that code does not have to be reused
										// Takes a boolean as an argument, so it knows whether the game will use input or not
	int random = rand() % 100 + 1;		// The random number to guess; seeding is done in the main method
	int demoUpper = 100;				// Used by the game's simple AI if running in demo mode
	int demoLower = 1;					// These are used to help the demo calculate where to guess next
	int numGuesses = 0;					// Keeps track of how many guesses it takes to guess the number
	int guess = 0;						// The user or demo's current guess; initialized to 0, an out-of-range value

	while (guess != random) {			// Loops as long as the user's guess is not the random value
		numGuesses++;					// Increments the number of guesses required for victory

		cout << "Enter your guess! ";	// Output asking the user (or demo) for their guess.
		if (!demo) {					// Executes these commands if the game is not in demo mode
			cin >> input;				// Accepts user input
			stringstream convert(input); // Uses whatever the user inputted
			if (!(convert >> guess))	// If what the user input was not a number...
				guess = 0;				// ...guess is set to 0, and the user is prompted to try again.
		}								// This functionality was not required but it made me nervous not having it
		else {							// These lines execute if the program IS in demo mode, i.e. demo == true
			guess = (demoUpper + demoLower) >> 1;		// The demo makes its guess by dividing the sum of the bounds by 2
			cout << guess << endl;						// Outputs what the guess is
		}
		if (guess < 1 || guess > 100) {					// Checks if the input is in valid range
			cout << "Invalid guess, please enter a number 1-100." << endl; // Outputs error message

		}
		else if (guess > random) {						// Checks if guess is valid and also too high
			cout << "Guess too high!" << endl;			// Outputs the message
			if (demo) {									// If the game is in demo mode...
				demoUpper = guess;						// Changes upper bound to what the current guess is
			}
		}
		else if (guess < random) {						// Checks if guess is valid and also too low
			cout << "Guess too low!" << endl;			// Outputs the message
			if (demo) {									// If the game is in demo mode...
				demoLower = guess;						// Changes lower bound to what the current guess is
			}
		}
	}

	return numGuesses;					// Returns the number of guesses it took to guess the number
}

int main()
{

	srand((unsigned)time(0));			// Seeds the random number generator
	bool demo = false;					// Defaults to not being in demo mode
	
	int numPlays = 0;					// Tracks how many times the game has been played
	int minGuesses = 0;					// Tracks the fewest guesses in which the game has been won
	int maxGuesses = 0;					// Tracks the most guesses in which the game has been won
	float averageGuesses = 0;			// A float that caluclates the average number of guesses per game at the end
	bool playAgain = true;				// Defaults to the game wanting to be played again

	cout << "Welcome to Joey Darroch's Number Guessing Game!!" << endl
		 << "   Try to guess a number from 1-100 in as few   \n"			// Simple introduction :D
		 << "        guesses as possible! But first...       " << endl;

	while (true) {										// Messy way to keep a loop going without a "real" argument
		cout << "    Would you like to see a demo first? (Y/N) \n";	// Asks player if they want to see the demo
		cin >> input;									// Accepts user input
		if (input == "Y" || input == "y") {				// If Y or y...
			demo = true;								// ...game is put into demo mode for one round.
			break;										// Breaks the loop
		}
		if (input == "N" || input == "n") {				// If N or n...
			demo = false;								// ...game remains in demo mode until user quits.
			break;										// Breaks the loop
		}
		
	}

	while (playAgain) {											// Keeps playing the game until the user decides to end
		int tempGuesses = playGame(demo);						// Plays the game; stores number of guesses in a var
		
		if (!demo) {											// Executes only if the game is not in demo mode
			if (minGuesses == 0 || minGuesses > tempGuesses)	// Checks if the minimum number of guesses needs to be set
				minGuesses = tempGuesses;						// or changed
			if (maxGuesses == 0 || maxGuesses < tempGuesses)	// Checks if the maximum number of guesses needs to be set
				maxGuesses = tempGuesses;						// or changed
			numPlays++;											// Increments the number of plays
			averageGuesses += tempGuesses;						// For now, adds the number of guesses to a running total...
		}
		demo = false;											// Demo can only run once, sets to false just in case

		cout << "YOU WIN!!!!" << endl;							// Yay :D
			while (true) {										// Another messy loop
				cout << "Want to play again? Y/N  \n";			// Asks user if they want to play again
				cin >> input;									// Accepts user input
				if (input == "Y" || input == "y")				// If Y or y...
					break;										// ...this loop breaks, and the game starts again.
				if (input == "N" || input == "n") {				// If N or n...
					playAgain = false;							// ...the game will NOT start again...
					break;										// ...and this loop breaks.
				}

			}
	}

	averageGuesses /= numPlays;									// Divides the running total of guesses by the # of plays

	cout << "Total number of rounds played:                          " << numPlays << endl		// Outputs stats here
		 << "The minimum number of trials to make the correct guess: " << minGuesses << endl
		 << "The maximum number of trials to make the correct guess: " << maxGuesses << endl
		 << "The average number of guesses per round:                " << averageGuesses << endl << endl
		 << "Enter in anything to exit! ";						// Prompts user to type anything to exit
	cin >> input;												// This gives user time to read

	return (EXIT_SUCCESS);										// Returns and ends the program!
}

