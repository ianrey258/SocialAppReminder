import 'package:flutter/material.dart';
import 'package:social_app_reminder/screens/AppPage.dart';
import 'package:social_app_reminder/screens/StartPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social App Reminder',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        backgroundColor: Colors.white,
        buttonTheme: ButtonThemeData(buttonColor: Colors.pink[200]),
        fontFamily: 'Roboto'
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => StartPage(),
        'AppPage': (BuildContext context) => AppPage(),
      }
    );
  }
}

