// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    this.organizationsDescriptions,
    this.locationDescriptions,
    this.budgetTypes,
  });

  final List<OrganizationsDescription> organizationsDescriptions;
  final List<LocationDescription> locationDescriptions;
  final List<BudgetType> budgetTypes;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    organizationsDescriptions: List<OrganizationsDescription>.from(json["organizationsDescriptions"].map((x) => OrganizationsDescription.fromJson(x))),
    locationDescriptions: List<LocationDescription>.from(json["locationDescriptions"].map((x) => LocationDescription.fromJson(x))),
    budgetTypes: List<BudgetType>.from(json["budgetTypes"].map((x) => BudgetType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "organizationsDescriptions": List<dynamic>.from(organizationsDescriptions.map((x) => x.toJson())),
    "locationDescriptions": List<dynamic>.from(locationDescriptions.map((x) => x.toJson())),
    "budgetTypes": List<dynamic>.from(budgetTypes.map((x) => x.toJson())),
  };
}

class BudgetType {
  BudgetType({
    this.code,
    this.description,
  });

  final String code;
  final String description;

  @override
  String toString() {
    return '${code} ${description}';
  }

  factory BudgetType.fromJson(Map<String, dynamic> json) => BudgetType(
    code: json["code"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "description": description,
  };
}

class LocationDescription {
  LocationDescription({
    this.provinceCode,
    this.description,
    this.dariDescription,
  });

  final int provinceCode;
  final String description;
  final String dariDescription;

  @override
  String toString() {
    return '${provinceCode} ${description}';
  }

  factory LocationDescription.fromJson(Map<String, dynamic> json) => LocationDescription(
    provinceCode: json["provinceCode"],
    description: json["description"],
    dariDescription: json["dariDescription"],
  );

  Map<String, dynamic> toJson() => {
    "provinceCode": provinceCode,
    "description": description,
    "dariDescription": dariDescription,
  };
}

class OrganizationsDescription {
  OrganizationsDescription({
    this.id,
    this.code,
    this.organizationDescription,
    this.dariDescription,
  });

  final int id;
  final int code;
  final String organizationDescription;
  final String dariDescription;

  @override
  String toString() {
    return '${code} ${organizationDescription}';
  }

  factory OrganizationsDescription.fromJson(Map<String, dynamic> json) => OrganizationsDescription(
    id: json["id"],
    code: json["code"],
    organizationDescription: json["organizationDescription"],
    dariDescription: json["dariDescription"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "organizationDescription": organizationDescription,
    "dariDescription": dariDescription,
  };
}
