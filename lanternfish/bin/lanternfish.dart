import 'dart:io';

import 'package:args/args.dart';
import 'package:lanternfish/lanternfish.dart';

Future<void> main(List<String> arguments) async {
  var parser = ArgParser()
    ..addOption("input",
        abbr: "i", mandatory: true, help: "The input file to read")
    ..addOption("days",
        abbr: "d", help: "The number of days to simulate. Exclude for 0");

  String inputFile;
  int days;
  try {
    var result = parser.parse(arguments);
    inputFile = result['input'];
    days = int.tryParse(result['days']) ?? 0;
  } catch (e) {
    print(parser.usage);
    return;
  }

  var input = await File(inputFile).readAsLines();
  var lanternfish = Lanternfish.parse(input[0]);
  lanternfish.advance(days);
  print("Count: ${lanternfish.count}");
}
