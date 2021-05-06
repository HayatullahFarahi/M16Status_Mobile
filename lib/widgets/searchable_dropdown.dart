//import 'package:flutter/material.dart';
//import 'package:m16status/models/search_model.dart';
//import 'package:m16status/widgets/msg_dialog.dart';
//import 'package:searchable_dropdown/searchable_dropdown.dart';
//
//class CustomDropdown extends StatefulWidget {
//  final SearchModel searchFromData;
//
//  const CustomDropdown({Key key, this.searchFromData}) : super(key: key);
//  @override
//  _CustomDropdownState createState() => _CustomDropdownState();
//}
//
//class Organization {
//  String name;
//  String code;
//
//  Organization({this.name, this.code});
//
//  @override
//  String toString() {
//    return '${name} ${code}';
//  }
//}
//
//class _CustomDropdownState extends State<CustomDropdown> {
//  List<Organization> _organizations;
//  OrganizationsDescription selectedValue;
////  Organization defaultValue = Organization(
////      code: "0",
////     name: "Select Item",
////  ) ;
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _organizations = [
//      Organization(code: "139000", name: "Ministry of Agriculture and more"),
//      Organization(code: "2", name: "def"),
//      Organization(code: "3", name: "dgg"),
//    ];
//  }
//  @override
//  Widget build(BuildContext context) {
//    var alterNativeListOrg = widget.searchFromData.organizationsDescriptions;
//    return SearchableDropdown(
//      items: alterNativeListOrg.map((item) {
//        return DropdownMenuItem<OrganizationsDescription>(
//            child: Text("${item.organizationDescription} - (${item.code})"),
//            value: item);
//      }).toList(),
////      validator: (selectedItem) {
////        if(selectedItem == null) return ("Organization is required");
////        return (null);
////      },
//      isExpanded: true,
////      displayClearIcon: selectedValue == null ? false : true,
//      value: selectedValue,
//      hint: "Select organization",
//      searchHint: Text(
//        'Select',
//        style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
//      ),
//      onChanged: (value) {
//        setState(() {
//          selectedValue = value;
//        });
//        MsgDialog.showMsgDialog(context, "title", value.toString());
//      },
//    );
//  }
//}
