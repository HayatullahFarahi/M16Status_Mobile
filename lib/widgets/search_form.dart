import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:m16status/models/search_model.dart';
import 'package:m16status/screens/m16_details_screen.dart';
import 'package:m16status/state/app_state.dart';
import 'package:m16status/utils/logs.dart';
import 'package:m16status/widgets/input_container.dart';
import 'package:m16status/widgets/loading_dialog.dart';
import 'package:m16status/widgets/msg_dialog.dart';
import 'package:provider/provider.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class SearchFrom extends StatefulWidget {
  @override
  _SearchFromState createState() => _SearchFromState();
}

class _SearchFromState extends State<SearchFrom> {
  final GlobalKey<FormState> _m16SearchFormKey = GlobalKey<FormState>();

  // form controllers
  final TextEditingController _m16Controller = new TextEditingController();
  //select items
  OrganizationsDescription _selectedOrganization;
  LocationDescription _selectedLocation;
  BudgetType _selectedBudgetType;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _m16SearchFormKey,
        child: Container (
            width: MediaQuery.of (context).size.width,
            child: Consumer<AppState>(
              builder: (context, state, child) {
                return FutureBuilder(
                    future: state.getSearchFormData(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if( snapshot.data == null )
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
//                            child: SpinKitRing(color: Theme.of(context).primaryColor),
                                  child: CircularProgressIndicator(
                                    backgroundColor: Theme.of(context).primaryColor,
                                  ),
                          )
                        );
                      else {
                        SearchModel searchModel = snapshot.data;
                        return Column(
                          children: [
                            //put Custom drop down here based on snapshot data
                            InputContainer(
                              height: null,
                              child: SearchableDropdown(
                                items: searchModel.organizationsDescriptions.map((item) {
                                  return DropdownMenuItem<OrganizationsDescription>(
                                      child: Text("${item.organizationDescription} - (${item.code})"),
                                      value: item);
                                }).toList(),
                                isExpanded: true,
                                value: _selectedOrganization,
                                hint: "Select organization",
                                searchHint: Text(
                                  'Select organization',
                                  style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedOrganization = value;
                                  });
                                },
                              )
                          ),
                            InputContainer(
                                height: null,
                                child: SearchableDropdown(
                                  items: searchModel.locationDescriptions.map((item) {
                                    return DropdownMenuItem<LocationDescription>(
                                        child: Text("${item.description} - (${item.provinceCode})"),
                                        value: item);
                                  }).toList(),
                                  isExpanded: true,
                                  value: _selectedLocation,
                                  hint: "Select location",
                                  searchHint: Text(
                                    'Select location',
                                    style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedLocation = value;
                                    });
                                  },
                                )
                            ),
                            InputContainer(
                                height: null,
                                child: SearchableDropdown(
                                  items: searchModel.budgetTypes.map((item) {
                                    return DropdownMenuItem<BudgetType>(
                                        child: Text("${item.description} - (${int.parse(item.code) + 1})"),
                                        value: item);
                                  }).toList(),
                                  isExpanded: true,
                                  value: _selectedBudgetType,
                                  hint: "Select budget type",
                                  searchHint: Text(
                                    'Select budget type',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedBudgetType = value;
                                    });
                                  },
                                )
                            ),
                            InputContainer(
                                height: 45,
                                child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: _m16Controller,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'M16 Code'
                                    )
                                )
                            ),
                            SizedBox(height: 25),
                            // ignore: deprecated_member_use
                            RaisedButton.icon(
                              onPressed: _submitForm,
                              color: Theme.of(context).primaryColor,
                              label: Text(
                                  "Search M16",
                                  style: TextStyle (
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                              icon: Icon(Icons.search, color: Colors.white),
                            ),
                          ],
                        );
                      }
                    }
                );
              }
            )
        ),
      )
    );
  }

  void _submitForm() async {
    if(_m16Controller.text.isEmpty || _selectedOrganization == null
      || _selectedLocation == null || _selectedBudgetType == null
    ) {
      MsgDialog.showMsgDialog(context, 'Alert!', "Please fill all the fields");
    } else {
      LoadingDialog.showLoadingDialog(context, 'Searching...');
      final _appState = Provider.of<AppState>(context, listen: false);
      Map<String, dynamic> successInfo = await _appState.getM16Details({
        "m16": _m16Controller.text,
        "organization": _selectedOrganization.code.toString(),
        "location": _selectedLocation.provinceCode.toString(),
        "budgetType": _selectedBudgetType.code,
        "sequenceNo": "1",
        "token": "token"
      });
      if (successInfo['success'] && successInfo['stageCount'] > 0) {
        LoadingDialog.hideLoadingDialog(context);
        setState(() {
          _m16Controller.text = "";
          _selectedBudgetType = null;
          _selectedLocation = null;
          _selectedOrganization = null;
        });
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    M16DetailsScreen(
                    )
            )
        );
      }
      else if (successInfo['stageCount'] == 0) {
        LoadingDialog.hideLoadingDialog(context);
        MsgDialog.showMsgDialog(context, 'Alert!', 'M16 Not Found!');
      }
      else {
        LoadingDialog.hideLoadingDialog(context);
        MsgDialog.showMsgDialog(
            context, 'Alert!', 'Something went wrong!');
      }
    }
  }
}
