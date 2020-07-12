import 'package:flutter/material.dart';
import 'package:mapp/game_button.dart';
import 'package:mapp/dialog_box.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<GameButton> buttonsList;
  var player1;
  var player2;
  var activePlayer;
  var scores = {'1': -1, '2': 1, '-1': 0};

  @override
  void initState() {
    super.initState();
    buttonsList = doInit();
  }

  List<GameButton> doInit() {
    player1 = new List();
    player2 = new List();
    activePlayer = 1;

    var gameButtons = <GameButton>[
      new GameButton(id: 1),
      new GameButton(id: 2),
      new GameButton(id: 3),
      new GameButton(id: 4),
      new GameButton(id: 5),
      new GameButton(id: 6),
      new GameButton(id: 7),
      new GameButton(id: 8),
      new GameButton(id: 9),
    ];
    return gameButtons;
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonsList = doInit();
    });
  }

  int checkWinner() {
    var winner = -1;
    winner = win();
    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            context: context,
            builder: (_) => DialogBox("Player 1 won",
                "Press the reset button to restart", resetGame));
      } else {
        showDialog(
            context: context,
            builder: (_) => DialogBox("Player 2 won",
                "Press the reset button to restart", resetGame));
      }
    }
    return winner;
  }

  int win() {
    int won = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      won = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      won = 2;
    }
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      won = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      won = 2;
    }
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      won = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      won = 2;
    }
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      won = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      won = 2;
    }
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      won = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      won = 2;
    }
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      won = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      won = 2;
    }
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      won = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      won = 2;
    }
    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      won = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      won = 2;
    }
    return won;
  }

  //NEW CODE

  minimax(depth, isMaximizing) {
    //1ST WAY this doesnt use bestMov()

    var best;
    var score;
    if (isMaximizing) {
      best = [-1, -1000];
    } else {
      best = [-1, 1000];
    }

    if (depth == 0 || win() > -1) {
      int result = win();
      return [-1, result];
    }

    for (var cellid = 1; cellid <= 9; cellid++) {
      if (!(player1.contains(cellid) || player2.contains(cellid))) {
        score = minimax(depth - 1, !(isMaximizing));
        score[0] = cellid;
      }

      if (isMaximizing) {
        if (score[1] > best[1]) {
          best[1] = score[1];
          best[0] = score[0];
        }
      } else {
        if (score[1] < best[1]) {
          best[1] = score[1];
          best[0] = score[0];
        }
      }
    }

    return best;

    //2ND WAY

    /*var result = new List(2);
    result[1] = win();
    if (result[1] == 1) {
      result[1] = 0;
    } else if (result[1] == 2) {
      result[1] = 1;
    } else {
      result[1] = 2;
    }
    if (result[1] > -1) {
      return scores[result[1]];
    }


    if (isMaximizing) {
      var bestScore = new List(2);
      bestScore[1] = -1000;
      var score = new List(2);
      var list = List.generate(9, (i) => i + 1);
      for (var cellid in list) {
        if (!(player1.contains(cellid) || player2.contains(cellid))) {
          score = minimax(depth - 1, false);
          bestScore = min(score, bestScore);
        }
      }
      return bestScore;
    } else {
      int bestScore = 1000;
      var score;
      var list = List.generate(9, (i) => i + 1);
      for (var cellid in list) {
        if (!(player1.contains(cellid) || player2.contains(cellid))) {
          score = minimax(depth - 1, true);
          bestScore = max(score[1], bestScore);
        }
      }
      return bestScore;
    }*/
  }

  /*void bestMove() {
    int bestScore = -1000;
    int score;
    int move;
    var list = List.generate(9, (i) => i + 1);
    for (var cellid in list) {
      if (!(player1.contains(cellid) || player2.contains(cellid))) {
        score = minimax(cellid, 0, true);
        if (score > bestScore) {
          bestScore = score;
          move = buttonsList.indexWhere((p) => p.id == cellid);
        }
      }
    }
  }
  var r = new Random();
    var randIndex = r.nextInt(emptyCells.length-1);
    var cellid = emptyCells[randIndex];
    int i = buttonsList.indexWhere((p) => p.id == cellid);
  */

  //OLD CODE

  /*minimax(id, depth, isMaximizing) {
    int result = win();
    if (result == 1) {
      result = 0;
    } else if (result == 2) {
      result = 1;
    } else {
      result = 2;
    }
    if (result > -1) {
      return scores[result];
    }
    if (isMaximizing) {
      int bestScore = 1000;
      int score;
      var list = List.generate(9, (i) => i + 1);
      for (var cellid in list) {
        if (!(player1.contains(cellid) || player2.contains(cellid))) {
          score = minimax(cellid, depth + 1, true);
          bestScore = min(score, bestScore);
        }
      }
      return bestScore;
    } else {
      int bestScore = -1000;
      int score;
      var list = List.generate(9, (i) => i + 1);
      for (var cellid in list) {
        if (!(player1.contains(cellid) || player2.contains(cellid))) {
          score = minimax(cellid, depth + 1, false);
          bestScore = max(score, bestScore);
        }
      }
      return bestScore;
    }
  }

  void bestMove() {
    int bestScore = -1000;
    int score;
    int move;
    var list = List.generate(9, (i) => i + 1);
    for (var cellid in list) {
      if (!(player1.contains(cellid) || player2.contains(cellid))) {
        score = minimax(cellid, 0, true);
        if (score > bestScore) {
          bestScore = score;
          move = buttonsList.indexWhere((p) => p.id == cellid);
        }
      }
    }
    /*var r = new Random();
    var randIndex = r.nextInt(emptyCells.length-1);
    var cellid = emptyCells[randIndex];
    int i = buttonsList.indexWhere((p) => p.id == cellid);
  */
    playGame(buttonsList[move]);
  }*/

  void playGame(GameButton gb) {
    setState(() {
      if (activePlayer == 1) {
        gb.text = "X";
        gb.bg = Colors.red;
        activePlayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = "O";
        gb.bg = Colors.black;
        activePlayer = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;
      int winner = checkWinner();
      if (winner == -1) {
        if (buttonsList.every((p) => p.text != "")) {
          showDialog(
              context: context,
              builder: (_) => DialogBox("Game Tied",
                  "Press the reset button to start again", resetGame));
        } else {
          activePlayer == 2
              ? minimax(1 /*pass depth here*/, true /*if this is AI*/)
              : null;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 500, vertical: 30.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: buttonsList.length,
              itemBuilder: (context, i) => SizedBox(
                width: 100,
                height: 100,
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  onPressed: buttonsList[i].enabled
                      ? () => playGame(buttonsList[i])
                      : null,
                  child: Text(
                    buttonsList[i].text,
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  color: buttonsList[i].bg,
                  disabledColor: buttonsList[i].bg,
                ),
              ),
            ),
          ),
          RaisedButton(
              child: Text(
                "Reset",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: Colors.black,
              padding: EdgeInsets.all(10),
              onPressed: resetGame),
        ],
      ),
    );
  }
}
