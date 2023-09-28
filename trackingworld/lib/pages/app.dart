import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';
import 'signup.dart';
import 'profile.dart';
import '../colors.dart';

class TrackingWorldApp extends StatelessWidget {
  const TrackingWorldApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TrackingWorld',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/signup': (BuildContext context) => const SignupPage(),
        '/home': (BuildContext context) => const HomePage(),
        '/profile': (BuildContext context) => const ProfilePage(),
      },
      theme: ThemeData(
          backgroundColor: kTwGray50,
          fontFamily: 'OpenSans', // Define a fonte padrão do aplicativo
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: kTwGray900,
              surfaceTintColor: kTwGray900,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          iconTheme: IconThemeData(color: Color(0x97C4BEBE)),
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
          )),
    );
  }
}
