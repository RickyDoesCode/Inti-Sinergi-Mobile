import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class GreyIcon extends StatelessWidget {
  final IconData icon;
  GreyIcon({this.icon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Icon(
        icon,
        color: light_gray,
      ),
    );
  }
}
