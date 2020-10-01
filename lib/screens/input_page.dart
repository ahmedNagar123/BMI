import 'package:bmi_calculator/component/calculator_brain.dart';
import 'package:bmi_calculator/component/icon_content.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../component/bottom_bottom.dart';
import '../component/reusable_widget.dart';
import '../component/row_icon_bottom.dart';
import '../constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 120;
  int weight = 70;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableWidget(
                    coulor: selectedGender == Gender.male
                        ? kActiveColorCard
                        : kInactiveColorCard,
                    cardChild: IconContent(
                      text: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  )),
                  Expanded(
                      child: ReusableWidget(
                    coulor: selectedGender == Gender.female
                        ? kActiveColorCard
                        : kInactiveColorCard,
                    cardChild: IconContent(
                      text: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ))
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableWidget(
                        coulor: kActiveColorCard,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'HEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  height.toString(),
                                  style: kLabelNumberTextStyle,
                                ),
                                Text(
                                  'cm',
                                  style: kLabelTextStyle,
                                )
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: kSliderActiveColor,
                                  inactiveTrackColor: kSliderInactiveColor,
                                  overlayColor: kSliderOverlayColor,
                                  thumbColor: kSliderThumbOverlayColor,
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 15),
                                  overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 30)),
                              child: Slider(
                                min: 70,
                                max: 220,
                                value: height.toDouble(),
                                onChanged: (double newValue) {
                                  setState(() {
                                    height = newValue.round();
                                  });
                                },
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableWidget(
                    coulor: kActiveColorCard,
                    cardChild: ColumnIconBottom(
                        firstText: 'WEIGHT',
                        secondText: weight.toString(),
                        iconMinus: FontAwesomeIcons.minus,
                        iconPlus: FontAwesomeIcons.plus,
                        onPressMinus: () {
                          setState(() {
                            weight--;
                          });
                        },
                        onPressPlus: () {
                          setState(() {
                            weight++;
                          });
                        }),
                  )),
                  Expanded(
                    child: ReusableWidget(
                        coulor: kActiveColorCard,
                        cardChild: ColumnIconBottom(
                            firstText: 'AGE',
                            secondText: age.toString(),
                            iconMinus: FontAwesomeIcons.minus,
                            iconPlus: FontAwesomeIcons.plus,
                            onPressMinus: () {
                              setState(() {
                                age--;
                              });
                            },
                            onPressPlus: () {
                              setState(() {
                                age++;
                              });
                            })),
                  )
                ],
              ),
            ),
            BottomBottom(
              onTap: () {
                CalculatorBrain cal =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResultPage(
                    bmiText: cal.calculateBMI(),
                    resultText: cal.resultText(),
                    bmiDetails: cal.getInterpretation(),
                  );
                }));
              },
              text: 'CALCULATE',
            )
          ],
        ));
  }
}
