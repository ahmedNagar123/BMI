import 'package:bmi_calculator/component/bottom_bottom.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

import '../component/reusable_widget.dart';

class ResultPage extends StatelessWidget {
  final String resultText;

  final String bmiText;
  final String bmiDetails;

  ResultPage({this.resultText, this.bmiText, this.bmiDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATE'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Expanded(
                child: Text(
                  'Your Result',
                  style: kLabelTextResult,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableWidget(
                coulor: kActiveColorCard,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiText,
                      style: kBMITextStyle,
                    ),
                    Text(
                      bmiDetails,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            BottomBottom(
              text: 'RECALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
