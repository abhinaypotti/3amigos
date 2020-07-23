
import 'package:flutter/material.dart';
import 'package:project/ai/ai.dart';
import 'package:project/ui/box.dart';
import 'package:project/ui/game_mechanism.dart';

class GamePage extends StatefulWidget {

  final String title;

  GamePage(this.title);

  @override
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> {

  List<int> board;
  int _currentPlayer;
  
  GameMechanism _presenter;

  GamePageState() {
    this._presenter = GameMechanism(_movePlayed, _onGameEnd);
  }

  void _onGameEnd(int winner) {

    var title = "Game over!";
    var content = "You lose :(";
    switch(winner) {
      case Ai.HUMAN: // will never happen :)
        title = "Congratulations!";
        content = "You managed to beat an unbeatable AI!";
        break;
      case Ai.AI_PLAYER:
        title = "Game Over!";
        content = "You lose :(";
        break;
      default:
        title = "Draw!";
        content = "No winners here.";
    }


    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    setState(() {
                      reinitialize();
                      Navigator.of(context).pop();
                    });
                  },
                  child: Text("Restart"))
            ],
          );
    });
  }

  void _movePlayed(int idx) {
    setState(() {
      board[idx] = _currentPlayer;

      if (_currentPlayer == Ai.HUMAN) {
        // switch to AI player
        _currentPlayer = Ai.AI_PLAYER;
        _presenter.afterHumanPlays(board);

      } else {
        _currentPlayer = Ai.HUMAN;
      }
    });
  }


  String getSymbolForIdx(int idx) {
    return Ai.SYMBOLS[board[idx]];
  }

  @override
  void initState() {
    super.initState();
    reinitialize();
  }

  void reinitialize() {
    _currentPlayer = Ai.HUMAN;
    // generate the initial board
    board = List.generate(9, (idx) => 0);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(60),
            child: Text("You are playing as X", style: TextStyle(fontSize: 25),),
          ),
           Expanded(
             child: GridView.count(
                      padding: EdgeInsets.symmetric(horizontal: 570, vertical: 10.0),
                      crossAxisCount: 3,
                      // generate the widgets that will display the board
                      children: List.generate(9, (idx) {
                        return Field(idx: idx, onTap: _movePlayed, playerSymbol: getSymbolForIdx(idx));
                      }),
                  ),
              ),
        ],
      ),
    );
  }
}


