#include<iostream>
#include "proto.h"

using std::cout;
using std::cin;

int player, ai;

bool isBoardFull(int arr[9]) {

	for (int i = 0; i < 9; i++) {
		if (arr[i] == '-')
			return false;
	}
	return true;
}

int checkWin(int arr[9]) {

	if (/*player wins*/1)
		return 1;
	else if(/*ai wins*/1)
		return -1;
}

bool gameOver(int arr[9]) {
	
	if (isBoardFull(arr))
		return 2;

		return checkWin(arr);
}

int minimax(int arr[9], int depth, bool max) {

	int test = checkWin(arr);

	if (test == 10)
		return test;
	if (test == -10)
		return test;

	if (gameOver(arr))
		return 0;

	if (max) {
		int bestmov = -1000;

	}
}

int main() {
	int arr[9] = { '-','-','-','-','-','-','-','-','-' };
}