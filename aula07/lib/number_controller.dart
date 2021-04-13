import 'number_model.dart';
import 'dart:math';

class NumberController {
  final model = NumberModel();

  String getNumber() => model.number.toString();

  generateNumber() {
    model.changeNumber(Random().nextInt(1000));
  }

  String getNumberParity() {
    if (model.number % 2 == 0)
      return "Par";
    else
      return "Impar";
  }
}
