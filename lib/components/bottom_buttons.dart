import 'package:flutter/material.dart';
import '../constants.dart';

class MovingButton extends StatelessWidget {
  MovingButton({@required this.onTapFun,@required this.ourText});
  final Function onTapFun;
  final String ourText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFun,
      child: Container(
        child: Center(
          child: Text(
            ourText,
            style: klabelLargeBottomTexttyle,
          ),
        ),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kbottomContainerHeight,
      ),
    );
  }
}
