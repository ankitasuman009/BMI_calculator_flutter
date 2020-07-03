import 'package:flutter/material.dart';

class BuildContainer extends StatelessWidget {

  BuildContainer(this.colour , this.ion, this.onpress);
  final Color colour;
  final Widget ion;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        height: 200.0,
        width: 150.0,
        child: Card(
          child: ion,
          color: colour,
          margin: EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}