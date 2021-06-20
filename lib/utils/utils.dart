import 'dart:io';
import 'package:flutter/material.dart';

class Utils {
  final Color primaryColor = goldColor;
  final Color secondaryColor = blueColor;
//  final Color primaryColor = Color(0xff48C4A4);
//  final Color primaryColor = Color(0xff2bbbad);
//  final baseUrl = "https://192.168.1.128:5001";
//  final baseUrl = "http://192.168.5.22:8088";
  final baseUrl = "https://10.0.2.2:5001";
  final localHost = Platform.isAndroid ? "http://10.0.2.2:5001" : "http://localhost:5001";
  //http://192.168.5.22:8088/ ATN network m16status hosted


  sortStages(stages) {
    print("CHEKC 1");
    print(stages);
    print(stages[0]['toStage']);
    print(stages[1]['toStage']);
    print(stages[2]['toStage']);
    print(stages[3]['toStage']);
    print(stages[4]['toStage']);
    var sortedStages = [];
    for (var i = 0; i < stages.length; i++) {
      if(_filterStagesNames(stages[i].toStage) == 'Created')
        sortedStages[0] = stages[i];
      else if (_filterStagesNames(stages[i].toStage) == 'Approval Requested')
        sortedStages[1] = stages[i];
      else if (_filterStagesNames(stages[i].toStage) == 'Approved')
        sortedStages[2] = stages[i];
      else if (_filterStagesNames(stages[i].toStage) == 'Released')
        sortedStages[3] = stages[i];
      else if (_filterStagesNames(stages[i].toStage) == 'Sent') {
        sortedStages[4] = stages[i];
        // sortedStages[4].toStage = 'Sent To Bank [EN]'
      }
      print("CHECKKKK");
      print(sortedStages.toString());
    }
//    return sortedStages;
  }
  _filterStagesNames(name) {
    return name.toStage.substring(0, name.toStage.length - 4);
  }
}


final Color blueColor = Color(0xff005a84);
final Color goldColor = Color(0xffcbbe95);