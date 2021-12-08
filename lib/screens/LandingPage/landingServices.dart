import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:thegreen_house/constants/Constantcolors.dart';
import 'package:thegreen_house/screens/Homepage/Homepage.dart';
import 'package:thegreen_house/services/Authentication.dart';

class LandingService with ChangeNotifier {
  TextEditingController userEmmailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPassController = TextEditingController();
  ConstantColors constantColors = ConstantColors();

  Widget passwordLessSignIn(BuildContext context) {
    resizeToAvoidBottomInset:false;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.40,
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('allUser').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
                children: snapshot.data!.docs
                    .map((DocumentSnapshot documentSnapshot) {
              return ListTile(
                trailing: IconButton(
                  icon: Icon(FontAwesomeIcons.trashAlt,
                      color: constantColors.redColor),
                  onPressed: () {},
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      (documentSnapshot.data() as dynamic)['image']),
                ),
                subtitle: Text(
                    (documentSnapshot.data() as dynamic)['useremail'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: constantColors.greenColor,
                        fontSize: 12.0)),
                title: Text((documentSnapshot.data() as dynamic)['username'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: constantColors.greenColor)),
              );
            }).toList());
          }
        },
      ),
    );
  }

  logInSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: Divider(
                    thickness: 4.0,
                    color: constantColors.whiteColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: userEmmailController,
                    decoration: InputDecoration(
                      hintText: 'Enter email...',
                      hintStyle: TextStyle(
                          color: constantColors.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    style: TextStyle(
                        color: constantColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: userPassController,
                    decoration: InputDecoration(
                      hintText: 'Enter password...',
                      hintStyle: TextStyle(
                          color: constantColors.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    style: TextStyle(
                        color: constantColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ),
                FloatingActionButton(
                    backgroundColor: constantColors.blueColor,
                    child: Icon(FontAwesomeIcons.check,
                        color: constantColors.whiteColor),
                    onPressed: () {
                      if (userEmmailController.text.isNotEmpty) {
                        Provider.of<Authentication>(context, listen: false)
                            .logIntoAccount(userEmmailController.text,
                                userPassController.text).whenComplete((){
                                  Navigator.pushReplacement(context, PageTransition(child: Homepage(),
                                      type: PageTransitionType.bottomToTop));
                        });
                      } else {
                        warningText(context, 'Fill all the data!');
                      }
                    }),
              ],
            ),
            ),
            decoration: BoxDecoration(
                color: constantColors.lightBlueColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0))),
          );
        });
  }

  signInSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: constantColors.lightBlueColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0)),
            ),
            child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: Divider(
                    thickness: 4.0,
                    color: constantColors.whiteColor,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: constantColors.transperant,
                  radius: 80.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      hintText: 'Enter name...',
                      hintStyle: TextStyle(
                          color: constantColors.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    style: TextStyle(
                        color: constantColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: userEmmailController,
                    decoration: InputDecoration(
                      hintText: 'Enter email...',
                      hintStyle: TextStyle(
                          color: constantColors.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    style: TextStyle(
                        color: constantColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: userPassController,
                    decoration: InputDecoration(
                      hintText: 'Enter password...',
                      hintStyle: TextStyle(
                          color: constantColors.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    style: TextStyle(
                        color: constantColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                child:FloatingActionButton(
                    backgroundColor: constantColors.redColor,
                    child: Icon(FontAwesomeIcons.check,
                        color: constantColors.whiteColor),
                    onPressed: () {
                      if (userEmmailController.text.isNotEmpty) {
                        Provider.of<Authentication>(context, listen: false)
                            .createAccount(userEmmailController.text,
                                userPassController.text).whenComplete((){
                          Navigator.pushReplacement(context, PageTransition(child: Homepage(),
                              type: PageTransitionType.bottomToTop));
                        });
                      } else {
                        warningText(context, 'Fill all the data!');
                      }
                    }),
                )
              ],
            ),
          ),
          );
        });
  }

  warningText(BuildContext context, String warning) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: constantColors.darkColor,
                borderRadius: BorderRadius.circular(15.0)),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(warning,
                  style: TextStyle(
                      color: constantColors.whiteColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold)),
            ),
          );
        });
  }
}
