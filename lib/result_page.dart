import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constant_file.dart';
import 'buildcontainer.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {
  ResultPage(this.bmiResult , this.getResult , this.inter);

  final String bmiResult;
  final String getResult;
  final String inter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Container(
            padding: EdgeInsets.only(top: 60.0 ),
              child: Text('YOUR RESULT', textAlign: TextAlign.center,
                style: kresultstyle,))),
          Expanded(
            flex: 5,
            child: BuildContainer(Color(0xFF1D1E33), Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(bmiResult, style: kresultstyle1),
                Text(getResult.toUpperCase(),style: kBMIstyle,),
                Text(inter,style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,),
                CalulateButton('RE-CALCULATE' , (){ Navigator.pop(context);
                }),
              ],
            ), (){}),
          ),
        ],
      ),
    );
  }
}
