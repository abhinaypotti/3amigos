#include<iostream>
#include "proto.h"

using std::cout;
using std::cin;

bool isBoardFull(Player arr[9]) {

	for (int i = 0; i < 9; i++) {
		if (arr[i] == Player::none)
			return false;
	}
	return true;
}

int checkWin(Player arr[9],Player player) {

	if (arr[1] == player && arr[2] == player && arr[3] == player){
		if(player == Player::ai){
			return 1;
		}
		else
		{
			return -1;
		}
	}
	if (arr[4] == player && arr[5] == player && arr[6] == player){
		if(player == Player::ai){
			return 1;
		}
		else
		{
			return -1;
		}
	}
	if (arr[7] == player && arr[8] == player && arr[9] == player){
		if(player == Player::ai){
			return 1;
		}
		else
		{
			return -1;
		}
	}
	if (arr[1] == player && arr[4] == player && arr[7] == player){
		if(player == Player::ai){
			return 1;
		}
		else
		{
			return -1;
		}
	}
	if (arr[2] == player && arr[5] == player && arr[8] == player){
		if(player == Player::ai){
			return 1;
		}
		else
		{
			return -1;
		}
	}
	if (arr[3] == player && arr[6] == player && arr[9] == player){
		if(player == Player::ai){
			return 1;
		}
		else
		{
			return -1;
		}
	}
	if (arr[1] == player && arr[5] == player && arr[9] == player){
		if(player == Player::ai){
			return 1;
		}
		else
		{
			return -1;
		}
	}
	if (arr[3] == player && arr[5] == player && arr[7] == player){
		if(player == Player::ai){
			return 1;
		}
		else
		{
			return -1;
		}
	}
	
}

/*bool gameOver(int arr[9]) {
		return checkWin(arr) || isBoardFull(arr);
}*/

int* minimax(Player arr[9], int depth, Player player) {

	int test[2];
	int bestmov[2];
	int score[2];

	test[1] = checkWin(arr,player);
	test[0] = -1;

	if (test[1] == 1)
		return test;


	if (test[1] == -1)
		return test;

	if (isBoardFull(arr) == true || depth == 0) {
		test[1] = 0;
		return test;
	}

	if (player == Player::human) {
		bestmov[1] = +1000;
		bestmov[0] = -1;
	}
	else {
		bestmov[1] = -1000;
		bestmov[0] = -1;
	}
	for (int i = 0; i < 9; i++) {

		if (arr[i] == Player::none) {

			arr[i] = player;

			if (player == Player::ai)

				score = minimax(arr, depth - 1, Player::human);

			else
				score = minimax(arr, depth - 1, Player::ai);

			arr[i] = Player::none;
			score[0] = i;

			if (player == Player::ai) {
				if (score[1] > bestmov[1]) {
					bestmov[1] = score[1];
					bestmov[0] = score[0];
				}
			}
			else
				if (score[1] < bestmov[1]) {
					bestmov[0] = score[0];
					bestmov[1] - score[1];
				}


		}
	}

	return bestmov;



}

int main() {
	Player arr[9];
	for (int i = 0; i < 9; i++) {
		arr[i] = Player::none;
	}


}
