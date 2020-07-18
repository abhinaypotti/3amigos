import 'utils.dart';

class Ai {

  // evaluation condition values
  static const int HUMAN = -1;
  static const int AI_PLAYER = 1;
  static const int NO_WINNERS_YET = 0;
  static const int DRAW = 2;

  static const int EMPTY_SPACE = 0;
  static const SYMBOLS = {EMPTY_SPACE: "", HUMAN: "X", AI_PLAYER: "O"};

  // arbitrary values for winning, draw and losing conditions
  static const int WIN_SCORE = 100;
  static const int DRAW_SCORE = 0;
  static const int LOSE_SCORE = -100;

  static const WIN_CONDITIONS_LIST = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  /// Returns the optimal move based on the state of the board.
  int play(List<int> board, int currentPlayer,int depth) {
    return getBestMove(board, currentPlayer,depth).move;
  }

  bool gameover(List<int> board){

    if(Utils.isBoardFull(board))
      return true;
    int score = Utils.evaluateBoard(board);
    if(score == 1 || score == -1 || score == 2)
      return true;
    
    return false;
  }

  /// This is where the actual Minimax algorithm is implemented
  Move getBestMove(List<int> board, int currentPlayer, int depth) {
    // try all possible moves
    Move bestMove;
    List<int> newBoard;
    if(depth==0 || gameover(board)){
      Move score;
      score.score = Utils.evaluateBoard(board) + depth;
      score.move = -1;
      return score;
      }
        // will contain our next best score
    if(currentPlayer == AI_PLAYER){
      bestMove.move= -1;
      bestMove.score = -10000;
      }
    else{
      bestMove.move = -1;
      bestMove.score = 10000;
      }
        
    for(int currentMove = 0; currentMove < board.length; currentMove++) {
      if (!Utils.isMoveLegal(board, currentMove)) continue;
    
          // we need a copy of the initial board so we don't pollute our real board
      newBoard = List.from(board);
    
          // make the move
      newBoard[currentMove] = currentPlayer;
    
          // solve for the next player
          // what is a good score for the opposite player is opposite of good score for us
      int nextScore = getBestMove(newBoard, Utils.flipPlayer(currentPlayer),depth--).score;
    
          // check if the current move is better than our best found move
      if (nextScore > bestMove.score && currentPlayer== AI_PLAYER) {
        bestMove.score = nextScore + depth;
        bestMove.move = currentMove;
        }
      if (nextScore < bestMove.score && currentPlayer== HUMAN) {
        bestMove.score = nextScore + depth;
        bestMove.move = currentMove;
          }
        }
    
    return bestMove;
     
  }


}

class Move {
  int score;
  int move;

  Move({this.score, this.move});
}