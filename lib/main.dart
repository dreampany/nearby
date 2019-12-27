import 'package:flutter/material.dart';
import 'package:nearby/home/home_screen.dart';
import 'package:nearby/login/login_screen.dart';
import 'package:nearby/splash/splash_screen.dart';

import 'package:nearby/misc/constants.dart' as Constants;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  final key = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Nearby",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder> {
        Constants.Screen.LOGIN: (BuildContext context) => LoginScreen(),
        Constants.Screen.HOME: (BuildContext context) => HomeScreen()
      }
    );
  }
}