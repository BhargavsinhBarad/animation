import 'package:animation/Screens/detail.dart';
import 'package:animation/Screens/favourite.dart';
import 'package:animation/Screens/home.dart';
import 'package:animation/Screens/planet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Provider/theme.dart';
import 'Screens/intro.dart';
import 'Screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isvisited = preferences.getBool("isIntroVisited") ?? false;
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<themeprovider>(create: (context) => themeprovider()),
      ],
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode:
            (Provider.of<themeprovider>(context, listen: true).theme.isdark ==
                    true)
                ? ThemeMode.light
                : ThemeMode.dark,
        initialRoute: (isvisited) ? 'Splash' : '/',
        routes: {
          '/': (context) => intro_page(),
          'Splash': (context) => Splash(),
          'home': (context) => home(),
          'planet': (context) => planet(),
          'detail': (context) => detail(),
          'favourite': (context) => favourite(),
        },
      ),
    ),
  );
}
