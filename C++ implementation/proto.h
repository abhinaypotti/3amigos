#pragma once

bool isBoardFull(int arr[9]);

int checkWin(int arr[9]);

bool gameOver(int arr[9]);

int minimax(int arr[9], int depth, bool max);

