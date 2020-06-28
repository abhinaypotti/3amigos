import 'package:flutter/material.dart';
import 'package:web_app/game_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<GameButton> buttonsList;
  var player1;
  var player2;
  var activePlayer;

  @override
    void initState(){
      super.initState();
      buttonsList = doInit();
    }

    List<GameButton> doInit(){
      player1 = new List();
      player2 = new List();
      activePlayer = 1;

      var gameButtons = <GameButton> [
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

  void playGame(GameButton gb){
      setState(() {
        if(activePlayer==1){
          gb.text = "X";
          gb.bg = Colors.red;
          activePlayer=2;
          player1.add(gb.id);
        }
        else{
          gb.text = "O";
          gb.bg = Colors.black;
          activePlayer = 1;
          player2.add(gb.id);
        }
        gb.enabled = false;
        checkWinner();
      });

  void checkWinner(){
    var winner = -1;
    if(player1.contains(1) && player1.contains(2) && player1.contains(3)){
      winner = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Tic Tac Toe"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 500,vertical: 50.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
          ),
        itemCount: buttonsList.length,
        itemBuilder: (context,i)=> SizedBox(
        width: 100,
        height: 100,
        child: RaisedButton(
        padding:EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        onPressed: buttonsList[i].enabled?()=>playGame(buttonsList[i]):null,
        child: Text(
          buttonsList[i].text,
          style: TextStyle(color: Colors.white,
          fontSize: 20.0),
          ),
        color: buttonsList[i].bg,
        disabledColor: buttonsList[i].bg,
        ),
      ),
    ),
    );
  }
}