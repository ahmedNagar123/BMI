import 'package:flutter/material.dart';

class ReusableWidget extends StatelessWidget {
  final Color coulor;
  final Widget cardChild;
  final Function onPress;

  ReusableWidget(
      {@required this.coulor, @required this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: coulor, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
