import 'package:bmi_caculator/screens/results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results.dart';
import 'package:bmi_caculator/calculation_brain.dart';
import 'package:bmi_caculator/components/bottom_buttons.dart';
import 'package:bmi_caculator/components/round_icon_button.dart';
enum Gender{
  male,
  female
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
 
 Color maleCardColour = kinactiveColour;
 Color femaleCardColour = kinactiveColour;
 Gender  selectedGender;
 int height =170;
 int weight =0;
 int age =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                   child: Row(
                      children:<Widget>[
                        Expanded(
                           child: ReusableCard(
                             onPress : (){
                               setState(() {
                                 selectedGender = Gender.male;
                               });
                             },
                           colour: selectedGender == Gender.male? 
                                   kactiveColour: 
                                   kinactiveColour,
                           childCard: IconContent(
                             textLine:'MALE',
                             iconType: FontAwesomeIcons.mars
                            ),
                          ),
                        ),
                        Expanded(
                           child: GestureDetector(
                             onTap: (){setState(() {
                                selectedGender = Gender.female;
                              });
                             },
                              child: ReusableCard(
                                onPress: (){
                                  setState(() {
                                    selectedGender = Gender.female;
                                  });
                                },
                              colour: selectedGender == Gender.female?
                                      kactiveColour:
                                      kinactiveColour,
                              childCard: IconContent(
                                textLine:'FEMALE',
                                iconType: FontAwesomeIcons.venus
                              ),
                                 ),
                           ),
                        ),
                      ]
                    ),
                  ),
                   Expanded(
                    child:ReusableCard(
                      colour: kactiveColour,
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'HEIGHT',
                           style: klabelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children:<Widget>[
                                Text(
                                  height.toString(),
                                  style: klabelNumberStyle,
                                ),
                                //SizedBox(width: 10.0,),
                                Text(
                                  'cm',
                                  style: klabelTextStyle,
                                ),
                              ]
                            ),
                            SliderTheme(
                                   data: SliderTheme.of(context).copyWith(
                                     activeTrackColor: Colors.white,
                                     inactiveTrackColor: Color(0xFF8D8E98) ,
                                     thumbColor: Color(0xFFEB1555),
                                     overlayColor:Color(0x29EB1555) ,
                                     thumbShape: 
                                      RoundSliderThumbShape(enabledThumbRadius: 15.0),
                                     overlayShape: 
                                       RoundSliderOverlayShape(overlayRadius:30.0),
                                   ),
                                   child: Slider(
                                    value: height.toDouble(),
                                    min: 120.0,
                                    max: 220.0,
                                    onChanged: (double myValue){
                                      setState(() {
                                        height = myValue.round(); 
                                      });
                                    },
                                   ),
                            ),
                        ]
                      ),
                    ),
                  ),
                  Expanded(
                   child: Row(
                      children:<Widget>[
                        Expanded(
                            child: ReusableCard(
                              colour:kactiveColour,
                              childCard: Column(
                               children: <Widget> [
                                Text(
                                  'WIGHT',
                                  style: klabelTextStyle,
                                  ),
                                Text(
                                  weight.toString(),
                                  style: klabelNumberStyle,
                                ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      MyButton(
                                       icon: FontAwesomeIcons.minus,
                                       onPressed: (){
                                         setState(() {
                                           weight--;
                                         });
                                       },
                                      ),
                                      SizedBox(
                                        width: 10.0
                                      ),
                                       MyButton(
                                       icon: FontAwesomeIcons.plus,
                                       onPressed: (){
                                         setState(() {
                                           weight++;
                                         });
                                       },
                                      ),
                                    ],
                                  ),
                                
                               ]
                              ),
                            ),
                        ),
                        Expanded(
                            child: ReusableCard(
                              colour:kactiveColour,
                              childCard: Column(
                               children: <Widget> [
                                Text(
                                  'AGE',
                                  style: klabelTextStyle,
                                  ),
                                Text(
                                  age.toString(),
                                  style: klabelNumberStyle,
                                ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      MyButton(
                                       icon: FontAwesomeIcons.minus,
                                       onPressed: (){
                                         setState(() {
                                           age--;
                                         });
                                       },
                                      ),
                                      SizedBox(
                                        width: 10.0
                                      ),
                                       MyButton(
                                       icon: FontAwesomeIcons.plus,
                                       onPressed: (){
                                         setState(() {
                                           age++;
                                         });
                                       },
                                      ),
                                    ],
                                  ),
                                
                               ]
                              ),
                            ),
                        ),
                      ]
                    ),
                  ),
                  MovingButton(
                    onTapFun: () {
                      CalculationBrain calc = CalculationBrain(height: height, weight: weight);

                      Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Results(
                         resultLine: calc.getresultText(),
                         resultNum: calc.getresultValue(),
                         resultInterpretation: calc.getfunInterpretation(),
                         )
                        ),
                      );
                    },
                    ourText: 'Calculate', 
                  ),
                ],
              ),
    );
  }
}
