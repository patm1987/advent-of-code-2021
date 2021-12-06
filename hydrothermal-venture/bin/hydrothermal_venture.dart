import 'dart:io';

import 'package:hydrothermal_venture/hydrothermal_venture.dart'
    as hydrothermal_venture;
import 'package:hydrothermal_venture/vent_map.dart';

Future<void> main(List<String> arguments) async {
  if (arguments.isEmpty) {
    print("Specify a file to read");
  }

  var input = await File(arguments[0]).readAsLines();
  var map = VentMap.parseLines(input);
  print("Read map");
  // print(map);

  print("Overlaps: ${map.countOverlaps()}");
}
