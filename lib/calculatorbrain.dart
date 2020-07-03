import 'dart:math';

class CalculationBrain{
  CalculationBrain(this.height , this.weight);
  final int height;
  final int weight;
  double _bmi;

  String calBMI(){
    _bmi = weight/pow(height / 100,  2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi >= 25)
      return 'Overweight.';
    else if(_bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String interpretation(){
    if(_bmi >= 25)
      return 'You need to go gym, after this pandemic situation over';
    else if(_bmi > 18.5)
      return 'Maintain this , great job';
    else
      return 'You need to eat a lot';
  }

}