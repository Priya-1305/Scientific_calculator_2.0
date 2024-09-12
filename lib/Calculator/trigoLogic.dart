import 'package:math_expressions/math_expressions.dart';
import 'dart:math';

class AsinFunction extends CustomFunction {
  AsinFunction() : super("asin", [Variable('x')], Number(0));

  double call(List<double> args) {
    return asin(args[0]);
  }
}

class AcosFunction extends CustomFunction {
  AcosFunction() : super("acos", [Variable('x')], Number(0));

  double call(List<double> args) {
    return acos(args[0]);
  }
}

class AtanFunction extends CustomFunction {
  AtanFunction() : super("atan", [Variable('x')], Number(0));

  double call(List<double> args) {
    return tan(args[0]);
  }
}
