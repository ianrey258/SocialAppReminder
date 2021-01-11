import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:convert';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  ScrollController sc;
  String name_app = '';

  static const MEDIA_BUTTON = [
    {
      'name' : 'Facebook',
      'time' : '0',
      'message' : '',
    },
    {
      'name' : 'Google',
      'time' : '0',
      'message' : '',
    },
    {
      'name' : 'Instagram',
      'time' : '0',
      'message' : '',
    },
    {
      'name' : 'Twitter',
      'time' : '0',
      'message' : '',
    },
    {
      'name' : 'Games',
      'time' : '0',
      'message' : '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0,10,0,10),
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
     child: Column(
       children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           textDirection: TextDirection.ltr,
           children: [
             Container(
               height: 100,
               width: 100,
               child: Image.asset("assets/img/clock.jpg"),
             )
           ],
         ),
         Container(
           margin: EdgeInsets.all(10),
           child: Text(name_app,style: TextStyle(color: Colors.black,decoration: TextDecoration.none,fontSize: 25,)),
         ),
         Container(
           margin: EdgeInsets.all(10),
           child: Text('Application to Halt',style: TextStyle(color: Colors.black,decoration: TextDecoration.none,fontSize: 20)),
         ),
         Expanded(
          //  height: MediaQuery.of(context).size.height*.30,
          flex: 4,
          child: GridView.count(
             padding: EdgeInsets.all(10),
              controller: sc,
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                Material(
                  color: Colors.pink[200],
                  borderRadius: BorderRadius.circular(100),
                  child: FlatButton(child: Icon(FontAwesome.facebook_f), onPressed: ()=> this.addTimeReminder(MEDIA_BUTTON[0])),
                ),
                Material(
                  color: Colors.pink[200],
                  borderRadius: BorderRadius.circular(100),
                  child: FlatButton(child: Icon(FontAwesome.google), onPressed: ()=> this.addTimeReminder(MEDIA_BUTTON[1])),
                ),
                Material(
                  color: Colors.pink[200],
                  borderRadius: BorderRadius.circular(100),
                  child: FlatButton(child: Icon(FontAwesome.instagram), onPressed: ()=> this.addTimeReminder(MEDIA_BUTTON[2])),
                ),
                Material(
                  color: Colors.pink[200],
                  borderRadius: BorderRadius.circular(100),
                  child: FlatButton(child: Icon(FontAwesome.twitter), onPressed: ()=> this.addTimeReminder(MEDIA_BUTTON[3])),
                ),
                Material(
                  color: Colors.pink[200],
                  borderRadius: BorderRadius.circular(100),
                  child: FlatButton(child: Icon(FontAwesome.gamepad), onPressed: ()=> this.addTimeReminder(MEDIA_BUTTON[4])),
                ),
            ],
          ),
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Container(
               child: RaisedButton(child: Icon(FontAwesome.plus_circle), onPressed: (){}),
             )
           ],
         )
       ],
     ), 
    );
  }

  Future<bool> addTimeReminder(content) {
    setState(() {
      name_app = content['name'];
    });
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_)=>AddTimeReminder(content: ContentData(name: content['name'],interval: content['interval'],message: content['message']),)
    );
  }
}

class AddTimeReminder extends StatefulWidget {
  final ContentData content; 

  AddTimeReminder({Key key,this.content}) : super(key: key);
  @override
  _AddTimeReminderState createState() => _AddTimeReminderState();
}

class _AddTimeReminderState extends State<AddTimeReminder> {
   List<TextEditingController> text = [];

   @override
  initState(){
    super.initState();
    setState(() {
      for(int i=0;i<10;i++){
        text.add(new TextEditingController());
      }
      text[0].text = '0';
    });
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.content.name),
      content: Container(
        padding: EdgeInsets.only(top: 15),
        height: MediaQuery.of(context).size.height*.4,
        child: Column(
          children: [
            Text('Enter Time Interval'),
            Container(
              margin: EdgeInsets.all(5),
              child: Row(
                children: [
                  Material(
                    color: Colors.pink[200],
                    borderRadius: BorderRadius.circular(100),
                    child: FlatButton(child: Icon(FontAwesome.angle_left), onPressed: ()=> text[0].text = text[0].text == '0' ? '0' : (int.parse(text[0].text.toString())-1).toString()),
                  ),
                  Expanded(
                    child: TextField(
                      controller: text[0],
                      decoration: InputDecoration(hintText: '0'),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                    ),
                  ),
                  Material(
                    color: Colors.pink[200],
                    borderRadius: BorderRadius.circular(100),
                    child: FlatButton(child: Icon(FontAwesome.angle_right), onPressed: ()=> text[0].text = (int.parse(text[0].text.toString())+1).toString()),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                color: Colors.pink[50],
                child: TextField(
                  controller: text[1],
                  decoration: InputDecoration(hintText: 'Message'),
                  expands: true,
                  maxLines: null,
                ),
              )
            )
          ],
        ),
      ),
      actions: [
        Material(
          color: Colors.pink[200],
          borderRadius: BorderRadius.circular(100),
          child: FlatButton(child: Text('cancel'), onPressed: ()=>Navigator.pop(context)),
        ),
        Material(
          color: Colors.pink[200],
          borderRadius: BorderRadius.circular(100),
          child: FlatButton(child: Text('ok'), onPressed: ()=>Navigator.pop(context)),
        ),
      ],
    );
  }
}

class ContentData{
  String name;
  String interval;
  String message;

  ContentData({this.name,this.interval,this.message});
}