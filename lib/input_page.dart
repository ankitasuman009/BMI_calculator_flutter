import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'buildcontainer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_file.dart';
import 'constant_file.dart';
import 'result_page.dart';
import 'calculatorbrain.dart';

Color col = Color(0xFF1D1E33);

CalculationBrain cal;

enum GenderType {
  MALE,
  FEMALE,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color malecolor = inactive;
  Color femalecolor = inactive;
  GenderType gen ;
  int height = 180;
  int weight = 50;
  int age = 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BuildContainer(gen == GenderType.MALE ? active : inactive,
                      ColumnIcon('MALE', FontAwesomeIcons.mars), (){
                      setState(() {
                        gen = GenderType.MALE;
                      });
                    },),
                ),
                Expanded(
                    child: BuildContainer(
                  gen == GenderType.FEMALE ? active : inactive,
                  ColumnIcon('FEMALE', FontAwesomeIcons.venus), (){
                      setState(() {
                        gen = GenderType.FEMALE;
                      });
                    },
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BuildContainer(col , Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('HEIGHT',style: labeltextstyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(height.toString(),
                          style: ktextstyle),
                          Text('cm',
                            style: labeltextstyle,),
                        ],
                      ),
                      Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8DBE98),
                        onChanged: (double newval){
                          setState(() {
                            height = newval.round();
                          });
                        },
                      ),
                    ],
                  ),(){}),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BuildContainer(col , Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT',style: labeltextstyle),
                      Text(weight.toString(),
                          style: ktextstyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.minus ,
                          onpress: (){
                            setState(() {
                              weight--;
                            });
                          },),
                          SizedBox(width: 10.0),
                          RoundIconButton(icon: FontAwesomeIcons.plus, onpress: (){
                            setState(() {
                              weight++;
                            });
                          },),
                        ],
                      ),
                    ],
                  ),(){}),
                ),
                Expanded(
                  child: BuildContainer(col , Column(
                    children: <Widget>[
                      Text('AGE',style: labeltextstyle),
                      Text(age.toString(),
                        style: ktextstyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                            onpress: (){
                            setState(() {
                              age--;
                            });
                          },),
                          SizedBox(width: 10.0),
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                            onpress: (){
                            setState(() {
                              age++;
                            });
                          },),
                        ],
                      ),
                    ],
                  ),(){}),
                ),
              ],
            ),
          ),
          CalulateButton('CALCULATE' , (){
            CalculationBrain cal = CalculationBrain(height , weight);
            Navigator.push(context , MaterialPageRoute(builder: (context) => ResultPage(
              cal.calBMI(),
              cal.getResult(),
              cal.interpretation(),

            )));
          },),
        ],
      ),
    );
  }
}

class CalulateButton extends StatelessWidget {

  CalulateButton(this.text , this.onpress);
  final String text;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: Center(
          child: Text(text,
          style: buttonstyle,),
        ),
        color: Color(0xFFEB1555),
        height: 70.0,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}


class RoundIconButton  extends StatelessWidget {

  RoundIconButton({this.icon , this.onpress});

  final IconData icon;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 46.0,
        height: 46.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
