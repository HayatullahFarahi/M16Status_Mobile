import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('About Us!'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Center(
                child: Column(children: [
                  Text(
                      "General Directorate of Treasury",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                        "M16 Status Mobile Application is development so that public can see the Details of their M16 from anywhere"
                    , style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Text("Contact Us!",
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0
                  )),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("For any technical issues, please contact using the following contact details:",
                        style: TextStyle(fontSize: 15)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("AFMIS DEV TEAM: ",style: TextStyle(fontWeight: FontWeight.bold),),
                            Text("+93 20 292 4168", style: TextStyle ( fontSize: 15)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Email: ",style: TextStyle(fontWeight: FontWeight.bold),),
                            Text("hayatullah.farahi@mof.gov.af", style: TextStyle ( fontSize: 15)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Contact No: ",style: TextStyle(fontWeight: FontWeight.bold),),
                            Text("+93 787 114 989", style: TextStyle ( fontSize: 15)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
