import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m16status/models/m16_details_model.dart';
import 'package:m16status/state/app_state.dart';
import 'package:m16status/widgets/m16_steps.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class M16DetailsScreen extends StatefulWidget {
  @override
  _M16DetailsScreenState createState() => _M16DetailsScreenState();
}

class _M16DetailsScreenState extends State<M16DetailsScreen> {
  final oCcy = new NumberFormat("#,##0.00", "en_US");
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('M16 Status'),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Center(
                  child: Text(
                    'M16 Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            ),
            Consumer<AppState>(
              builder: (context, state, child) {
                M16StatusDetail stageOneData = state.m16Model.m16StatusDetails[0];
                return DataTable(
                    columns: [
                      DataColumn(label: Text(
                          "Name"
                      )),
                      DataColumn(label: Text(
                         "Value"
                      )),
                    ],
                    rows: [
                     DataRow(cells: [
                         DataCell(Text("Print Date :",style: TextStyle(fontWeight: FontWeight.bold),)),
                         DataCell(Text(stageOneData.printeddate.toUtc().toString().substring(0, 16), style: TextStyle(fontWeight: FontWeight.bold),)),
                     ]),
                      DataRow(cells: [
                         DataCell(Text("Cheque Number :",style: TextStyle(fontWeight: FontWeight.bold),)),
                         DataCell(Text(stageOneData.chequenumber.toString(), style: TextStyle(fontWeight: FontWeight.bold),)),
                     ]),
                      DataRow(cells: [
                        DataCell(Text("Cheque Amount :",style: TextStyle(fontWeight: FontWeight.bold),)),
                        DataCell(Text(oCcy.format(stageOneData.chequeAmount), style: TextStyle(fontWeight: FontWeight.bold),)),
                     ]),

                    ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider( color: Colors.grey,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                    'M16 Stages Processed',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).highlightColor),
                  )),
            ),
            M16Steps(),
          ],
        ),
      ),
    );
  }
}
