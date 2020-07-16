import 'dart:async';

import 'package:project/ai/Ai.dart';
import 'package:project/ai/Utils.dart';

class GamePresenter {

  // callbacks into our UI
  void Function(int idx) showMoveOnUi;
  void Function(int winningPlayer) showGameEnd;

  Ai _aiPlayer;

  GamePresenter(this.showMoveOnUi, this.showGameEnd) {
    _aiPlayer = Ai();
  }

  void onHumanPlayed(List<int> board) async {

    // evaluate the board after the human player
    int evaluation = Utils.evaluateBoard(board);
    if (evaluation != Ai.NO_WINNERS_YET) {
      onGameEnd(evaluation);
      return;
    }

    // calculate the next move, could be an expensive operation
    int aiMove = await Future(() => _aiPlayer.play(board, Ai.AI_PLAYER));

    // do the next move
    board[aiMove] = Ai.AI_PLAYER;

    // evaluate the board after the AI player move
    evaluation = Utils.evaluateBoard(board);
    if (evaluation != Ai.NO_WINNERS_YET)
      onGameEnd(evaluation);
    else
      showMoveOnUi(aiMove);
  }

  void onGameEnd(int winner) {

    showGameEnd(winner);
  }




}