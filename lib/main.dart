import 'package:flutter/material.dart';
import 'package:flutter_app_listviewer/pages/home.dart';
import 'package:splashscreen_extend/splashscreen_extend.dart';

Future<Widget> loadAndLaunch() async {

  // Do some start up things or let the app just wait:
  await Future.delayed(const Duration(seconds: 2), () => "2");

  return MaterialApp(
    home: SafeArea(
      child: Home(),
    ),
  );
}

Future<void> main() async {
  runApp(
    MaterialApp(
      title: 'Caribe Smarts Plants',
      home: SafeArea(
        child: SplashScreen(
          widgetToNavigateAfterFuture: loadAndLaunch(),
          backgroundColor: Colors.white,
          logo: Image.asset(
            'assets/logo_caribesmartsplants.jpg',
          ),
        ),
      ),
    ),
  );
}