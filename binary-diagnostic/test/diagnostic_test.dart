import 'package:binary_diagnostic/diagnostic.dart';
import 'package:test/test.dart';

final _sampleInput = """00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010"""
    .split("\n");

void main() {
  test("Test constructor", () {
    final diagnostic = Diagnostic(_sampleInput);
  });

  test("Test computes gamma", () {
    final diagnostic = Diagnostic(_sampleInput);
    expect(diagnostic.gammaRate, 22);
  });

  test("Test computes epsilon rate", () {
    final diagnostic = Diagnostic(_sampleInput);
    expect(diagnostic.epsilonRate, 9);
  });

  test("Test computes oxygen generator rating", () {
    final diagnostic = Diagnostic(_sampleInput);
    expect(diagnostic.oxygenGeneratorRating, 23);
  });

  test("Test computes co2 scrubber rating", () {
    final diagnostic = Diagnostic(_sampleInput);
    expect(diagnostic.co2ScrubberRating, 10);
  });
}
