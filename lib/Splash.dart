import 'dart:async';

import 'package:flutter/material.dart';
import 'home.dart';

class Splash extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => Home(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            child: Text(
              "Scanner",
              style: TextStyle(
                  color: Color(0xff002C10),
                  decoration: TextDecoration.none,
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Powered by",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xff002C10),
                  decoration: TextDecoration.none,
                  fontSize: 16.0,
                ),
              ),
              Text(
                "CodeBanaa",
                style: TextStyle(
                    color: Color(0xff002C10),
                    decoration: TextDecoration.none,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 10),
          child: Text(
            "Made in INDIA",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff002C10),
              decoration: TextDecoration.none,
              fontSize: 16.0,
            ),
          ),
        ),
      ]),
    );
  }
}
