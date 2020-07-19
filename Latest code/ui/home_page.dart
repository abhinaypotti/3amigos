import 'package:flutter/material.dart';
import 'package:project/ui/game_page.dart';
import 'game_presenter.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;
  

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GamePresenter d;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("Welcome to Flutter Tic Tac Toe!", style: TextStyle(fontSize: 50),),
          Text("Select the depth",style: TextStyle(fontSize: 50),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 570, vertical: 10.0),
          child: Row(children: [
            
            RaisedButton(onPressed: ()=>d.Depth(1),child: Text("1",style: TextStyle(fontSize: 50),),),
            RaisedButton(onPressed: ()=>d.Depth(2),child: Text("2",style: TextStyle(fontSize: 50),),),
            RaisedButton(onPressed: ()=>d.Depth(3),child: Text("3",style: TextStyle(fontSize: 50),),),
            RaisedButton(onPressed: ()=>d.Depth(4),child: Text("Max",style: TextStyle(fontSize: 50),),),
          ],),
        ),
          Center(
            child: ButtonTheme(
              minWidth: 200,
              height: 80,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.amber, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                color: Colors.amber,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GamePage(widget.title))
                  );
                },
                child: Text("New game!", style: TextStyle(fontSize: 20),),
              ),
            ),
          ),
       
        ],
      ),
    );
  }
}

