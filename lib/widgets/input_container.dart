import 'package:flutter/material.dart';

class InputContainer extends StatelessWidget {
  final Widget child;
  final double height;

  const InputContainer({Key key, this.child, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container (
        width: MediaQuery.of (context).size.width/1.2,
        height: height,
        margin: EdgeInsets.only (top: 25),
        padding: EdgeInsets.only (top: 4, left: 16, right: 16, bottom: 4),
        decoration: BoxDecoration (
            borderRadius: BorderRadius.all (
                Radius.circular (5)
            ),
            color: Colors.white, boxShadow:
        [
          BoxShadow (
              color: Colors.black12, blurRadius: 5)
        ]
        ),
      child: child,
    );
  }
}
