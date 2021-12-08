import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:thegreen_house/constants/Constantcolors.dart';
import 'package:thegreen_house/screens/LandingPage/%20landingHelpers.dart';

class Landingpage extends StatelessWidget {
  final ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    resizeToAvoidBottomInset:false;
    return Scaffold(
        backgroundColor: Colors.green[700],
        body: Stack(
          children: [
            bodyColor(),
            Provider.of<LandingHelpers>(context, listen: false)
                .bodyImage(context),
            Provider.of<LandingHelpers>(context, listen: false)
                .taglineText(context),
            Provider.of<LandingHelpers>(context, listen: false)
                .mainButton(context),
            Provider.of<LandingHelpers>(context, listen: false)
                .privacyText(context),
          ],
        ));
  }

  bodyColor() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
            0.5,0.9
          ],
              colors: [
            constantColors.darkColor,
          ])),
    );
  }
}
