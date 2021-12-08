import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:thegreen_house/constants/Constantcolors.dart';
import 'package:thegreen_house/screens/Homepage/Homepage.dart';
import 'package:thegreen_house/screens/LandingPage/landingServices.dart';
import 'package:thegreen_house/services/Authentication.dart';

class LandingHelpers with ChangeNotifier {
  ConstantColors constantColors = ConstantColors();

  Widget bodyImage(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/login.png'))),
    );
  }

  Widget taglineText(BuildContext context) {
    resizeToAvoidBottomInset:false;
    return Positioned(
        top: 300.0,
        left: 10.0,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 400.0,
          ),
          child: RichText(
              text: TextSpan(
                  text: 'Chung ',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: constantColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                  children: const <TextSpan>[
                TextSpan(
                  text: 'tay ',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
                TextSpan(
                  text: 'bảo ',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
                TextSpan(
                  text: 'vệ môi trường, ngay hôm nay bạn nhé!',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                )
              ])),
        ));
  }

  Widget mainButton(BuildContext context) {
    resizeToAvoidBottomInset:false;
    return Positioned(
        top: 500.0,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  emailAuthSheet(context);
                },
                child: Container(
                  child: Icon(EvaIcons.emailOutline,
                      color: constantColors.darkColor),
                  width: 80.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: constantColors.darkColor),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('Signing with Google');
                  Provider.of<Authentication>(context, listen: false)
                      .signInWithGoogle()
                      .whenComplete(() {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: Homepage(),
                            type: PageTransitionType.leftToRight));
                  });
                },
                child: Container(
                  child: Icon(FontAwesomeIcons.google,
                      color: constantColors.redColor),
                  width: 80.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: constantColors.redColor),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ],
          ),
        ));
  }

  Widget privacyText(BuildContext context) {
    resizeToAvoidBottomInset:false;
    return Positioned(
        top: 550.0,
        left: 20.0,
        right: 20.0,
        child: Container(
          child: Column(
            children: [
              Text("Greenhouse",
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
              Text("Google Developer Student Clubs - Saigon University",
                  style: TextStyle(color: Colors.white, fontSize: 10.0))
            ],
          ),
        ));
  }

  emailAuthSheet(BuildContext context) {

    return showModalBottomSheet(
        context: context,
        builder: (context) {

          return Container(

            child: Column(

              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: Divider(
                    thickness: 4.0,
                    color: constantColors.whiteColor,
                  ),
                ),
                Provider.of<LandingService>(context, listen: false)
                    .passwordLessSignIn(context),
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(

                        color: constantColors.blueColor,
                        child: Text('Log in',
                            style: TextStyle(
                                color: constantColors.whiteColor,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Provider.of<LandingService>(context, listen: false)
                              .logInSheet(context);
                        }),
                    MaterialButton(
                        color: constantColors.redColor,
                        child: Text('Sign in',
                            style: TextStyle(
                                color: constantColors.whiteColor,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Provider.of<LandingService>(context, listen: false)
                              .signInSheet(context);
                        })
                  ],
                )
              ],
            ),

            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(

                color: constantColors.whiteColor,
                borderRadius: BorderRadius.only(

                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0))),
          );
        });
  }
}
