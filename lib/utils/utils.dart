import 'dart:io';
import 'package:flutter/material.dart';

class Utils {
  final Color primaryColor = Color(0xff48C4A4);
//  final Color primaryColor = Color(0xff2bbbad);
  final baseUrl = "https://192.168.1.8:5001";
  final localHost = Platform.isAndroid ? "http://10.0.2.2:5001" : "http://localhost:5001";
  //http://192.168.5.22:8088/ ATN network m16status hosted
}
