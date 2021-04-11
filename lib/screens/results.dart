import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusable_card.dart';
import 'package:bmi_caculator/components/bottom_buttons.dart';
class Results extends StatelessWidget {  
 
  Results({ @required this.resultNum, @required this.resultLine, @required this.resultInterpretation});
   final String resultNum;
  final String resultLine;
  final String resultInterpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text(' BMI CACULATOR'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[
          Expanded(
            child: Text(
            'Your Result',
             style: klabelLargeBottomTexttyle,
             textAlign: TextAlign.center,
             ),
          ),
          Expanded(
            flex: 5,
              child: ReusableCard(
                colour: kactiveColour,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget>[
                   Text(
                     resultLine.toUpperCase(),
                     style: klabelResultText,
                     ),
                   Text( 
                     resultNum,
                     style: klabelResultNumber,
                     ),
                   Text(
                     resultInterpretation,
                     style: klabelResultBodyText,
                     textAlign: TextAlign.center,
                     ),
                  ]
                ),
              ),
            ),
           MovingButton(
             onTapFun: () {
                Navigator.pop(context);
              },
             ourText:'RE-Calculate',
             ),
        ]
      ), 
    );
  }
}