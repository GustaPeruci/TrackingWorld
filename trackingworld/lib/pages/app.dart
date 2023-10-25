import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';
import 'signup.dart';
import 'profile.dart';
import 'editProfile.dart';
import 'travelPost.dart';
import 'settings.dart';
import 'favorites.dart';
import 'travel.dart';
import '../colors.dart';

ThemeData myTheme = ThemeData(
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: kTwGray900),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kTwGray900),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kTwGray900),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 8.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        primary: kTwGray900,
      ),
    ),
    backgroundColor: kTwGray50,
    fontFamily: 'OpenSans',
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
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
    ));

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
          '/editProfile': (BuildContext context) => const EditProfilePage(),
          '/settings': (BuildContext context) => const SettingsPage(),
          '/travelPost': (BuildContext context) => const TravelPostPage(),
          '/favorites': (BuildContext context) => const FavoritesPage(),
          '/travel': (BuildContext context) => const TravelPage(),
        },
        theme: myTheme);
  }
}
