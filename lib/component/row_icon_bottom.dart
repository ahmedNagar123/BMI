import 'package:flutter/material.dart';

import '../constants.dart';

class RowIconButton extends StatelessWidget {
  final IconData iconData;
  final Function onPress;

  RowIconButton({this.iconData, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      onPressed: () {
        onPress();
      },
      elevation: 15,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      fillColor: kRowButtonIcon,
      shape: CircleBorder(),
    );
  }
}

class ColumnIconBottom extends StatelessWidget {
  final String firstText;
  final String secondText;
  final IconData iconMinus;
  final IconData iconPlus;
  final Function onPressMinus;
  final Function onPressPlus;

  ColumnIconBottom(
      {this.firstText,
      this.secondText,
      this.iconPlus,
      this.iconMinus,
      this.onPressPlus,
      this.onPressMinus});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          firstText,
          style: kLabelTextStyle,
        ),
        Text(
          secondText,
          style: kLabelNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RowIconButton(
              iconData: iconMinus,
              onPress: onPressMinus,
            ),
            SizedBox(
              width: 10,
            ),
            RowIconButton(
              iconData: iconPlus,
              onPress: onPressPlus,
            )
          ],
        )
      ],
    );
  }
}
