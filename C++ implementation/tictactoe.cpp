#include<iostream>
#include "proto.h"

using std::cout;
using std::cin;

int bestmov[2];

bool isBoardFull(int arr[9]) {

	for (int i = 0; i < 9; i++) {
		if (arr[i] == Player::none)
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

/*bool gameOver(int arr[9]) {

		return checkWin(arr) || isBoardFull(arr);
}*/

int minimax(int arr[9], int depth, Player player) {

	int score[2];

	int test = checkWin(arr);

	if (test == 1)
		return test;
	if (test == -1)
		return test;

	if (isBoardFull(arr))
		return 0;

	if (player = Player::human)
		bestmov[1] = +1000;
	else
		bestmov[1] = -1000;

	for (int i = 0; i < 9; i++) {
		if (arr[i] == Player::none) {
			arr[i] = player;
			if (player == Player::ai) {
				score[0] = i;
				score[1] = minimax(arr, depth - 1, Player::human);
			}
			else {

				score[0] = i;
				score[1] = minimax(arr, depth - 1, Player::ai);
			}
			arr[i] = Player::none;

			if (player == Player::ai) {
				if (score[1] > bestmov[1]) {
					bestmov[1] = score[1];
					bestmov[0] = bestmov[0];
				}
			}
			else
				if (score[1] < bestmov[1]) {
					bestmov[0] = score[0];
					bestmov[1] - score[1];
				}
		}
	}

	return bestmov[1];



}

int main() {
	int arr[9] = { '-','-','-','-','-','-','-','-','-' };
}
