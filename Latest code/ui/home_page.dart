import 'package:flutter/material.dart';
import 'package:project/ui/game_page.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("Welcome to Flutter Tic Tac Toe!", style: TextStyle(fontSize: 20),),
          Center(
            child: ButtonTheme(
              minWidth: 200,
              height: 80,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.amber, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
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
