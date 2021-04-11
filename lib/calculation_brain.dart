import 'dart:math';
class CalculationBrain {
 CalculationBrain({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi =0;
  

 String getresultValue(){
    _bmi = weight / pow( height/100 , 2 );
   return _bmi.toStringAsFixed(1);
 }
 
 String getfunInterpretation(){
   if( _bmi >= 24)
     return 'You have a higher than normal body weight, Try to EXERICES more.';
    else if ( _bmi > 18.5 )
     return 'You have a normal body weight, Good Job';
    else
     return 'You have a lower than normal body weight, Try to gain more WIEIGHT';
  }
  String getresultText(){
   if( _bmi >= 25)
     return 'OverWeighted';
    else if ( _bmi > 18.5 )
     return 'Normal';
     else
      return 'UnderWeighted';
    
  }

}
