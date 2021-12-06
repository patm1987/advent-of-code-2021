import 'dart:io';

import 'package:sonar_sweep/sonar_sweep.dart' as sonar_sweep;

Future<void> main(List<String> arguments) async {
  if (arguments.isEmpty) {
    print('Error: pass in a file to read. Optionally a window size');
    return;
  }

  final filename = arguments[0];
  final windowSize;
  if (arguments.length < 2) {
    windowSize = 1;
  } else {
    windowSize = int.tryParse(arguments[1]);
  }

  if (windowSize == null) {
    print("Error: couldn't parse ${arguments[1]} as a window size");
    return;
  }

  final file = File(filename);
  if (!await file.exists()) {
    print("Error, $filename doesn't exist");
    return;
  }

  final data = sonar_sweep.parseString(await file.readAsString());
  final increases = sonar_sweep.countIncreases(data, window: windowSize);

  print("$increases increases");
}
