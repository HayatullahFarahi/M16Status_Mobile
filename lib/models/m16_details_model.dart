// To parse this JSON data, do
//
//     final m16Model = m16ModelFromJson(jsonString);

import 'dart:convert';

M16Model m16ModelFromJson(String str) => M16Model.fromJson(json.decode(str));

String m16ModelToJson(M16Model data) => json.encode(data.toJson());

class M16Model {
  M16Model({
    this.reCaptcha,
    this.m16StatusDetails,
    this.stagesCount,
  });

  final bool reCaptcha;
  final List<M16StatusDetail> m16StatusDetails;
  final int stagesCount;

  factory M16Model.fromJson(Map<String, dynamic> json) => M16Model(
    reCaptcha: json["reCaptcha"],
    m16StatusDetails: List<M16StatusDetail>.from(json["m16StatusDetails"].map((x) => M16StatusDetail.fromJson(x))),
    stagesCount: json["stagesCount"],
  );

  Map<String, dynamic> toJson() => {
    "reCaptcha": reCaptcha,
    "m16StatusDetails": List<dynamic>.from(m16StatusDetails.map((x) => x.toJson())),
    "stagesCount": stagesCount,
  };
}

class M16StatusDetail {
  M16StatusDetail({
    this.pwfid,
    this.id,
    this.applicationid,
    this.pepid,
    this.statusnum,
    this.fiscalYear,
    this.transitionTimeStamp,
    this.userId,
    this.userDept,
    this.fromStageId,
    this.toStageId,
    this.chequenumber,
    this.chequeAmount,
    this.fromStage,
    this.toStage,
    this.printeddate,
    this.printed,
    this.transitionName,
    this.stepNote,
    this.codingBlock,
    this.m16,
    this.budgetType,
    this.sequenceNo,
    this.organization,
    this.location,
  });

  final int pwfid;
  final int id;
  final String applicationid;
  final int pepid;
  final dynamic statusnum;
  final dynamic fiscalYear;
  final DateTime transitionTimeStamp;
  final dynamic userId;
  final dynamic userDept;
  final dynamic fromStageId;
  final dynamic toStageId;
  final int chequenumber;
  final int chequeAmount;
  final dynamic fromStage;
  final String toStage;
  final DateTime printeddate;
  final int printed;
  final dynamic transitionName;
  final String stepNote;
  final dynamic codingBlock;
  final dynamic m16;
  final dynamic budgetType;
  final dynamic sequenceNo;
  final dynamic organization;
  final dynamic location;

  factory M16StatusDetail.fromJson(Map<String, dynamic> json) => M16StatusDetail(
    pwfid: json["pwfid"],
    id: json["id"],
    applicationid: json["applicationid"],
    pepid: json["pepid"],
    statusnum: json["statusnum"],
    fiscalYear: json["fiscalYear"],
    transitionTimeStamp: DateTime.parse(json["transitionTimeStamp"]),
    userId: json["userID"],
    userDept: json["userDept"],
    fromStageId: json["fromStageID"],
    toStageId: json["toStageID"],
    chequenumber: json["chequenumber"],
    chequeAmount: json["chequeAmount"],
    fromStage: json["fromStage"],
    toStage: json["toStage"],
    printeddate: DateTime.parse(json["printeddate"]),
    printed: json["printed"],
    transitionName: json["transitionName"],
    stepNote: json["stepNote"],
    codingBlock: json["codingBlock"],
    m16: json["m16"],
    budgetType: json["budgetType"],
    sequenceNo: json["sequenceNo"],
    organization: json["organization"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "pwfid": pwfid,
    "id": id,
    "applicationid": applicationid,
    "pepid": pepid,
    "statusnum": statusnum,
    "fiscalYear": fiscalYear,
    "transitionTimeStamp": transitionTimeStamp.toIso8601String(),
    "userID": userId,
    "userDept": userDept,
    "fromStageID": fromStageId,
    "toStageID": toStageId,
    "chequenumber": chequenumber,
    "chequeAmount": chequeAmount,
    "fromStage": fromStage,
    "toStage": toStage,
    "printeddate": printeddate.toIso8601String(),
    "printed": printed,
    "transitionName": transitionName,
    "stepNote": stepNote,
    "codingBlock": codingBlock,
    "m16": m16,
    "budgetType": budgetType,
    "sequenceNo": sequenceNo,
    "organization": organization,
    "location": location,
  };
}
