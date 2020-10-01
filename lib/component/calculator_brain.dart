import 'dart:math';

class CalculatorBrain {
  final int weight;
  final int height;
  double _bmi;

  CalculatorBrain({this.weight, this.height});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String resultText() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= (25)) {
      return 'you have than normal body.';
    } else if (_bmi > 18) {
      return 'you have a normal body weight. good job';
    } else {
      return 'you have a lower than normal body weight .';
    }
  }
}
