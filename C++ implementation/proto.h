#pragma once

enum class Player {
	none = '-',
    human = 'X',
	ai = 'O'
	
};

bool isBoardFull(Player arr[9]);

int checkWin(Player arr[9]);

bool gameOver(Player arr[9]);

int minimax(Player arr[9], int depth, bool max);

