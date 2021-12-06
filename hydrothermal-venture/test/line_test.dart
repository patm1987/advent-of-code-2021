import 'dart:math';

import 'package:hydrothermal_venture/line.dart';
import 'package:test/test.dart';

void main() {
  test('Test can parse a line from string', () {
    var input = "0,9 -> 5,9";
    var line = Line.parse(input);
    expect(line, Line(Point(0, 9), Point(5, 9)));
  });
}
