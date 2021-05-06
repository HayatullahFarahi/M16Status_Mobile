import 'package:flutter/material.dart';

class DrawerBuilder extends StatefulWidget {



  @override
  _DrawerBuilderState createState() => _DrawerBuilderState();
}

class _DrawerBuilderState extends State<DrawerBuilder> {
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          ///user Details section
          Container(
            padding: EdgeInsets.only(top: 50, left:20, bottom: 20),
            decoration: BoxDecoration (
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 90.0, // has the effect of softening the shadow
                  spreadRadius: -50.0, // has the effect of extending the shadow
//                    spreadRadius: -12.0,
//                    blurRadius: 12.0,
                  offset: Offset(
                    2.0, // horizontal, move right 10
                    2.0, // vertical, move down 10
                  ),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipOval(
                    child: Container(
                      height: 100,
                      width: 100,
                      child: FadeInImage(
                        image: AssetImage('assets/mof.png'),
                        placeholder: AssetImage('assets/mof.png'),
                      ),
                    )
                ),
                Container(height: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("General Directorate of Treasury - AFMIS"
                      , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)
                  ),
                ),
                ]
            ),
          ),
          ///Home
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),

        ],
      ),
    );
  }
}

