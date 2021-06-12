import 'package:flutter/material.dart';
import 'package:m16status/models/m16_details_model.dart';
import 'package:m16status/state/app_state.dart';
import 'package:provider/provider.dart';

class M16Steps extends StatefulWidget {
  @override
  _M16StepsState createState() => _M16StepsState();
}

class _M16StepsState extends State<M16Steps> {
  int _currentStep;
  StepperType stepperType = StepperType.vertical;
  List<Step> stepsList = <Step>[
    Step(title: Text("Created"), content: Text("Test")),
    Step(title: Text("Approval Requested"), content: Text("Test")),
    Step(title: Text("Approved"), content: Text("Test")),
    Step(title: Text("Released"), content: Text("Test")),
    Step(title: Text("Sent To Bank"), content: Text("Test")),
  ];

  void _stepTapped(int s) {
    if (!stepsList[s].isActive) return null;
    setState(() {
      _currentStep = s;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final _appState = Provider.of<AppState>(context, listen: false);
    _currentStep = _appState.m16Model.stagesCount - 1;
    print("_appState.m16Model.stagesCount - 1");
    print(_appState.m16Model.stagesCount - 1);
    print(_currentStep);
    createSteps(_appState.m16Model);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, state, child) {
      M16StatusDetail stageOneData = state.m16Model.m16StatusDetails[0];
      return Container(
          child: Theme(
            data: ThemeData(
              colorScheme: ColorScheme.light(
                primary: Theme.of(context).primaryColor
              )
            ),
            child: Stepper(
                steps: stepsList,
                type: StepperType.vertical,
                currentStep: _currentStep,
                onStepTapped: _stepTapped,
                controlsBuilder: (BuildContext context,
                    {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                    return Row(
                      children: <Widget>[
                        Container(
                          child: null,
                        ),
                        Container(
                          child: null,
                        ),
                      ],
                    );
                },
      ),
          ));
    });
  }

  List<Step> createSteps(M16Model m16DetailsData) {
    List<M16StatusDetail> stagesData = m16DetailsData.m16StatusDetails;
    //TODO: SORT STEPS
    for(int i = 0; i < stagesData.length; i++) {
      print(stagesData[i].toStage.toString());
      print(stagesData[i].toStage == 'Created [en]');
      stepsList[i] = Step(
          title: stagesData[i].toStage != 'Sent [en]' ? Text(stagesData[i].toStage.substring(0, stagesData[i].toStage.length - 4))
          : Text("Sent To Bank"),
          content: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text("No")),
                DataColumn(label: Text("Stage")),
                DataColumn(label: Text("Stage Update Time")),
                DataColumn(label: Text("Step Note")),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text(
                    (stagesData.indexOf(stagesData[i]) + 1).toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataCell(
                      stagesData[i].toStage != 'Sent [en]' ? Text(stagesData[i].toStage.substring(0, stagesData[i].toStage.length - 4))
                          : Text("Sent To Bank")
                  ),
                  DataCell(Text(
                      stagesData[i].printeddate.toUtc().toString().substring(0, 16))),
                  DataCell(Text(stagesData[i].stepNote)),
                ]),
              ],
            ),
          ),
          state: m16DetailsData.stagesCount > stagesData.indexOf(stagesData[i])
              ? StepState.complete
              : StepState.indexed,
          isActive: m16DetailsData.stagesCount > stagesData.indexOf(stagesData[i])
              ? true
              : false);
    }
    return stepsList;
  }
}
