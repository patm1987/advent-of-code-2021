import 'dart:io';

import 'package:args/args.dart';
import 'package:dive/aim_submarine.dart';
import 'package:dive/command_parser.dart';
import 'package:dive/submarine.dart';

Future<void> main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption("input",
        abbr: "i", mandatory: true, help: "The path to the input file to parse")
    ..addFlag("aim",
        abbr: "a", help: "When set, up and down adjusts aim rather than depth");

  final String filename;
  final Submarine submarine;
  try {
    final results = parser.parse(arguments);
    filename = results['input'];
    if (results['aim']) {
      submarine = AimSubmarine();
    } else {
      submarine = Submarine();
    }
  } catch (e) {
    print(parser.usage);
    return;
  }

  print("Reading $filename");
  var commands = await File(filename).readAsLines();
  final commandParser = CommandParser(submarine);
  commands.forEach(commandParser.parseCommand);
  final position = submarine.getPosition();
  print("Submarine Position: $position");
  print("Result: ${position.x * position.y}");
}
