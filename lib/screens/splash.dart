import 'dart:async';
import 'package:flutter/material.dart';
import 'package:screen_flow/screens/home.dart';
import 'package:screen_flow/screens/onboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? firstTime = prefs.getBool('first_time');

    var _duration = new Duration(seconds: 3);

    if (firstTime != null && !firstTime) {
      // Not first time
      return new Timer(
          _duration,
          () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return HomePage();
              })));
    } else {
      // First time
      prefs.setBool('first_time', false);
      return new Timer(
          _duration,
          () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return OnboardScreen();
              })));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gym Trainer',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Image.asset(
              'images/logo.jpg',
              width: 100,
              height: 100,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
