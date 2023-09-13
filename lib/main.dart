import 'package:animation/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/intro.dart';
import 'Screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isvisited = preferences.getBool("isIntroVisited") ?? false;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: (isvisited) ? 'Splash' : '/',
    theme: ThemeData(useMaterial3: true),
    routes: {
      '/': (context) => intro_page(),
      'Splash': (context) => Splash(),
      'home': (context) => home(),
    },
  ));
}
