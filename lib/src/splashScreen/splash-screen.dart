import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? firstTime = prefs.getBool('first_time');
    var _duration = const Duration(seconds: 3);
    if (firstTime != null && !firstTime) {
      return Timer(_duration, navigationPageHome);
    } else {
      prefs.setBool('first_time', false);
      return Timer(_duration, navigationPageWel);
    }
  }
  void navigationPageHome() {
    Navigator.of(context).pushReplacementNamed('/PestDiseases');
  }
  void navigationPageWel() {
    Navigator.of(context).pushReplacementNamed('/MyApp');
  }
  @override
  void initState() {
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Text(
                  'AgroWeb ',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                Image.asset(
                  "assets/images/headerLogo.png",
                  fit: BoxFit.contain,
                  height: 32,
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 100.0),
              padding: const EdgeInsets.only(top: 50.0),
              child: const CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}