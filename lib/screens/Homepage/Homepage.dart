import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thegreen_house/constants/Constantcolors.dart';

class Homepage extends StatelessWidget {
  ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context){

    return Container(

      height: MediaQuery.of(context).size.height * 0.50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/greenhouse.png')),
          ),
    );

  }

}