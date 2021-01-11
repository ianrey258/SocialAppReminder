
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(0,25,0,0),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Image.asset("assets/img/clock.jpg",fit: BoxFit.contain,),
            )
          ),
          Expanded(
            flex: 4,
            child: Center(
              child: Text("Alarm Mo Ba?",style: TextStyle(color: Colors.black,decoration: TextDecoration.none),),
            )
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Container(
                // color: Colors.pink[200],
                child: RaisedButton(
                  color: Colors.pink[200],
                  child: Icon(Icons.arrow_forward_ios_rounded),
                  onPressed: ()=>Navigator.pushNamed(context, 'AppPage'),
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}