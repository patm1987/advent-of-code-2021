import 'dart:io';

import 'package:lanternfish/lanternfish.dart';
import 'package:test/test.dart';

void main() {
  test('Initializing from test', () {
    var lanternfish = Lanternfish([1, 2, 3]);
    expect(lanternfish.state, [1, 2, 3]);
  });

  test('Advances one day', () {
    var lanternfish = Lanternfish([1, 2, 3]);
    lanternfish.advance(1);
    expect(lanternfish.state, [0, 1, 2]);
  });

  test('spawns', () {
    var lanternfish = Lanternfish([0]);
    lanternfish.advance(1);
    expect(lanternfish.state, [6, 8]);
  });

  test('advances multiple days', () {
    var lanternfish = Lanternfish([1, 2, 3]);
    lanternfish.advance(2);
    expect(lanternfish.state, [6, 0, 1, 8]);
  });

  test('reads initial state', () async {
    var input = await File("inputs/sample.txt").readAsLines();
    var lanternfish = Lanternfish.parse(input[0]);
    expect(lanternfish.state, [3, 4, 3, 1, 2]);
  });
}
