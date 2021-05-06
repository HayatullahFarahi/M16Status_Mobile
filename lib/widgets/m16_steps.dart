import 'package:flutter/material.dart';
import 'package:m16status/models/m16_details_model.dart';
import 'package:m16status/state/app_state.dart';
import 'package:provider/provider.dart';


class M16Steps extends StatefulWidget {
  @override
  _M16StepsState createState() => _M16StepsState();
}

class _M16StepsState extends State<M16Steps> {

  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  List<Step> stepsList = new List<Step>();

  void _stepTapped(int s){
    if(!stepsList[s].isActive) return null;
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
    createSteps(_appState.m16Model);
  }

  @override
  Widget build(BuildContext context) {
    return
      Consumer<AppState>(
        builder: (context, state, child) {
          M16StatusDetail stageOneData = state.m16Model.m16StatusDetails[0];
          return Container(
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
              )
          );
        }
    );
  }
  List<Step> createSteps(M16Model m16DetailsData) {
    List<M16StatusDetail> stagesData = m16DetailsData.m16StatusDetails;
    stepsList = stagesData.map((e) =>
        Step(
            title: Text(e.toStage.substring(0, e.toStage.length - 4)),
            content: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text(
                      "No"
                  )),
                  DataColumn(label: Text(
                      "Stage"
                  )),
                  DataColumn(label: Text(
                      "Transition Time"
                  )),
                  DataColumn(label: Text(
                      "Step Note"
                  )),

                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text((stagesData.indexOf(e) + 1).toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
                    DataCell(Text( e.toStage.substring(0, e.toStage.length - 4))),
                    DataCell(Text(e.printeddate.toUtc().toString().substring(0, 16))),
                    DataCell(Text(e.stepNote)),
                  ]),
                ],
              ),
            ),
            state: m16DetailsData.stagesCount > stagesData.indexOf(e)
                ? StepState.complete
                : StepState.indexed,
            isActive: m16DetailsData.stagesCount > stagesData.indexOf(e)
                ? true
                : false
        )).toList();
    return stepsList;
  }

}




