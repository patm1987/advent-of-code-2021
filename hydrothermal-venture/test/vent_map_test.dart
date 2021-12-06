import 'dart:io';
import 'dart:math';

import 'package:hydrothermal_venture/line.dart';
import 'package:hydrothermal_venture/vent_map.dart';
import 'package:test/test.dart';

void main() {
  test('creates horizonal line', () {
    var line = Line(Point(0, 0), Point(10, 0));
    var ventMap = VentMap([line]);
    for (int i = 0; i <= 10; i++) {
      expect(ventMap.get(i, 0), 1);
    }
  });

  test('creates inverted horizonal line', () {
    var line = Line(Point(10, 0), Point(0, 0));
    var ventMap = VentMap([line]);
    for (int i = 0; i <= 10; i++) {
      expect(ventMap.get(i, 0), 1);
    }
  });

  test('creates vertical line', () {
    var line = Line(Point(0, 0), Point(0, 10));
    var ventMap = VentMap([line]);
    for (int i = 0; i <= 10; i++) {
      expect(ventMap.get(0, i), 1);
    }
  });

  test('creates inverted vertical line', () {
    var line = Line(Point(0, 10), Point(0, 0));
    var ventMap = VentMap([line]);
    for (int i = 0; i <= 10; i++) {
      expect(ventMap.get(0, i), 1);
    }
  });

  test('creates diagonal line', () {
    var line = Line(Point(0, 0), Point(3, 3));
    var ventMap = VentMap([line]);
    var expected = """1000
0100
0010
0001
""";
    expect(ventMap.toString(), expected);
  });

  test('parses sample input', () async {
    var input = await File("inputs/sample.txt").readAsLines();
    var ventMap = VentMap.parseLines(input);
    expect(ventMap.toString(), """1010000110
0111000200
0020101110
0001020200
0112313211
0001020000
0010001000
0100000100
1000000010
2221110000
""");
    expect(ventMap.countOverlaps(), 12);
  });
}
