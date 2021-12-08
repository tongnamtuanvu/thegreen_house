import 'dart:async';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:thegreen_house/constants/Constantcolors.dart';
import 'package:thegreen_house/screens/LandingPage/landingPage.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  ConstantColors constantColors = ConstantColors();
  @override
  void initState() {
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            PageTransition(
                child: Landingpage(), type: PageTransitionType.fade)));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[700],
        body: Center(
            child: RichText(
                text: TextSpan(
          text: 'Greenhouse',
          style: TextStyle(
              fontFamily: 'Poppins',
              color: constantColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 30.0),
        ))));
  }
}
