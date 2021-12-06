import 'dart:io';

import 'package:args/args.dart';
import 'package:binary_diagnostic/diagnostic.dart';

Future<void> main(List<String> arguments) async {
  var parser = ArgParser();
  parser.addOption('input',
      abbr: 'i', mandatory: true, help: "Input file to parse");

  String inputFilename;
  try {
    final results = parser.parse(arguments);
    inputFilename = results['input'];
  } catch (e) {
    print(parser.usage);
    return;
  }

  var lines = await File(inputFilename).readAsLines();
  var diagnostic = Diagnostic(lines);
  print('epsilon: ${diagnostic.gammaRate}');
  print('gamma: ${diagnostic.epsilonRate}');
  print('multiplied: ${diagnostic.gammaRate * diagnostic.epsilonRate}');
  print('oxygen: ${diagnostic.oxygenGeneratorRating}');
  print('co2: ${diagnostic.co2ScrubberRating}');
  print(
      'multiplied: ${diagnostic.oxygenGeneratorRating * diagnostic.co2ScrubberRating}');
}
