import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:m16status/models/m16_details_model.dart';
import 'package:m16status/models/search_model.dart';
import 'package:m16status/utils/logs.dart';
import 'package:m16status/utils/utils.dart';

class AppState extends ChangeNotifier {
  // getters
  get error => _error;
  get errorMessage => _errorMessage;
  get searchFormDataJSON => _searchFormDataJSON;
  get m16DetailsDataJSON => _m16DetailsDataJSON;

  //variables
  int test = 4457;
  bool _error = false;
  String _errorMessage;
  var _searchFormDataJSON;
  var _m16DetailsDataJSON;

  // Objects
  Dio _dio = Dio();
  var _utils = Utils();
  M16Model m16Model = M16Model();

  Future<SearchModel> getSearchFormData() async {
    try {
      Response response = await _dio.get("${_utils.baseUrl}/api/search");
      this._error = false;
      _errorMessage = "";
      _searchFormDataJSON = json.encode(response.data);
      final searchModel = searchModelFromJson(json.encode(response.data));
      ProjectLog.logIt("appstate", "search",
          searchModel.organizationsDescriptions.toString());
      return searchModel;
    } on DioError catch (error) {
      this._error = true;
      _errorMessage = "Could not get search form data";
      ProjectLog.logIt("appstate", "search", error.message);
      return null;
    }
  }

  Future<Map<String, dynamic>> getM16Details(Map<String, dynamic> data) async {
    try {
      Response response =
          await _dio.post("${_utils.baseUrl}/api/search", data: data);
      this._error = false;
      _errorMessage = "";
      _m16DetailsDataJSON = json.encode(response.data);
      m16Model = m16ModelFromJson(_m16DetailsDataJSON);
      return {'success': true, 'stageCount': m16Model.stagesCount};
    } on DioError catch (error) {
      this._error = true;
      _errorMessage = "Could not fetch M16 data!";
      return {'success': false, 'message': _errorMessage};
    }
  }
}
