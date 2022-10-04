import 'package:flutter/material.dart';
const labelTextStyle = TextStyle(fontSize: 18.0,
    color: Color(0xFF8D8E98));

class IconContent extends StatelessWidget {
  IconContent({@required this.icon, @required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(text, style: labelTextStyle)
      ],
    );
  }
}