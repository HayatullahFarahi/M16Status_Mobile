import 'package:flutter/material.dart';
import 'package:m16status/widgets/drawer.dart';
import 'package:m16status/widgets/search_form.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> homeScreenScaffoldKey =
      GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScreenScaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () => homeScreenScaffoldKey.currentState.openDrawer(),
        ),
        title: Text('M16 Status'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchFrom(),
          ],
        ),
      ),
      drawer: DrawerBuilder(),
    );
  }
}
