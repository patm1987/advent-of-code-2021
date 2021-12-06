import 'dart:io';

import 'package:sonar_sweep/sonar_sweep.dart';
import 'package:test/test.dart';

void main() {
  test('counts no increases', () {
    const input = <int>[];
    expect(countIncreases(input), 0);
  });

  test('counts one increase', () {
    const input = <int>[0, 1];
    expect(countIncreases(input), 1);
  });

  test("doesn't count decrease", () {
    const input = <int>[1, 0];
    expect(countIncreases(input), 0);
  });

  test("sample input", () {
    const input = <int>[199, 200, 208, 210, 200, 207, 240, 269, 260, 263];
    expect(countIncreases(input), 7);
  });

  test('loads sample', () async {
    const expected = <int>[199, 200, 208, 210, 200, 207, 240, 269, 260, 263];
    final data = await File("test/sample_data.txt").readAsString();
    expect(parseString(data), expected);
  });

  test('loads empty data', () async {
    final data = await File("test/empty_data.txt").readAsString();
    expect(parseString(data), []);
  });

  test('skips bad data', () async {
    final data = await File("test/bad_data.txt").readAsString();
    expect(parseString(data), [1, 2]);
  });

  test("Doesn't count data smaller than the window", () {
    expect(countIncreases([], window: 3), 0);
    expect(countIncreases([1], window: 3), 0);
    expect(countIncreases([1, 2], window: 3), 0);
  });

  test("Ignores single element in window 3", () {
    expect(countIncreases([1, 2, 3], window: 3), 0);
  });

  test("Counts one increase in window of 3", () {
    expect(countIncreases([1, 2, 3, 4], window: 3), 1);
  });

  test("Works with sample data", () {
    const input = <int>[199, 200, 208, 210, 200, 207, 240, 269, 260, 263];
    expect(countIncreases(input, window: 3), 5);
  });
}
