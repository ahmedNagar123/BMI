import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomBottom extends StatelessWidget {
  final Function onTap;
  final String text;

  BottomBottom({this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: kLabelLargeText,
          ),
        ),
        color: kBottomColorCard,
        width: double.infinity,
        height: kBottomCardHeight,
        padding: EdgeInsets.only(bottom: 20),
        margin: EdgeInsets.only(top: 10),
      ),
    );
  }
}
