import 'dart:io';
import 'package:flutter/material.dart';
import 'package:m16status/screens/splash_screen.dart';
import 'package:m16status/state/app_state.dart';
import 'package:m16status/utils/my_http_overrides.dart';
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
  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
    return MaterialApp(
      title: 'M16 Status',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: utils.primaryColor,
        highlightColor: utils.secondaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}


