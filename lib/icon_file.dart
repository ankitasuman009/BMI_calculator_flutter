import 'package:flutter/material.dart';
import 'constant_file.dart';

class ColumnIcon extends StatelessWidget {
  ColumnIcon(this.txt, this.icons );
  final String txt;
  final IconData icons;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icons),
        SizedBox(
          height: 5.0,
        ),
        Text(
          txt,
          style: labeltextstyle,
        ),
      ],
    );
  }
}