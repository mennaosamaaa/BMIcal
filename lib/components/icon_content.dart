import 'package:bmi_caculator/constants.dart';
import 'package:flutter/material.dart';
import '../constants.dart';


class IconContent extends StatelessWidget {
 
 final String textLine;
 final IconData iconType;
 IconContent({this.textLine, this.iconType});
 

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
       Icon(
         iconType,
         size: 80.0,
       ),
       SizedBox(
         height: 15.0,
       ),
       Text(
         textLine,
         style:klabelTextStyle,
         ),
     ]
    );
  }
}