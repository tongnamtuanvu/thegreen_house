import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thegreen_house/constants/Constantcolors.dart';
import 'package:thegreen_house/screens/LandingPage/%20landingHelpers.dart';
import 'package:thegreen_house/screens/LandingPage/landingServices.dart';
import 'package:thegreen_house/screens/Splashscreen/splashScreen.dart';
import 'package:thegreen_house/services/Authentication.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
    return MultiProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            accentColor: constantColors.blueColor,
            fontFamily: 'Poppins',
            canvasColor: Colors.transparent,

          ),
          home: Splashscreen(),
        ),
        providers: [
          ChangeNotifierProvider(create: (_) => LandingService()),
          ChangeNotifierProvider(create: (_) => Authentication()),
          ChangeNotifierProvider(create: (_) => LandingHelpers())

        ]);
  }
}
