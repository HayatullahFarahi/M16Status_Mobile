import 'dart:io';

import 'package:flutter/material.dart';
import 'package:m16status/screens/splash_screen.dart';
import 'package:m16status/state/app_state.dart';
import 'package:m16status/utils/myhttp_overrides.dart';
import 'package:provider/provider.dart';
import './utils/utils.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var utils = Utils();
    return MaterialApp(
      title: 'M16 Status',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: utils.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}


