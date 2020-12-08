import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:animated_text/animated_text.dart';
import 'package:snaplance/Screens/landingPage.dart';
import 'package:snaplance/Style/font.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 7);
    return new Timer(_duration, navigationPage);
  }

  Widget navigationPage() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return LandingPage();
    }));
  }

  double sigmaX = 1; // from 0-10
  double sigmaY = 1; // from 0-10
  double opacity = 0.1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
              child: Container(
                color: Colors.black.withOpacity(opacity),
              ),
            ),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('asset/images/photographerBackground.jpg'),
                    fit: BoxFit.fill)),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            right: 20,
            left: 20,
            child: Column(
              children: [
                Container(
                  // height: 100,
                  child: Text(
                    "Snaplance",
                    style: kSplashFont.copyWith(
                        fontSize: 55,
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Container(
                  height: 100,
                  child: AnimatedText(
                    alignment: Alignment.center,
                    speed: Duration(milliseconds: 1000),
                    controller: AnimatedTextController.loop,
                    displayTime: Duration(milliseconds: 1000),
                    wordList: ['One', 'Stop', 'For', 'Photophiles'],
                    textStyle: kSplashFont,
                    onAnimate: (index) {
                      print("Animating index:" + index.toString());
                    },
                    onFinished: () {
                      print("Animtion finished");
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
