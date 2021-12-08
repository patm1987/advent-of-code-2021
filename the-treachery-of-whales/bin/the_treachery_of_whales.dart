import 'dart:io';

import 'package:the_treachery_of_whales/crab_swarm.dart';

Future<void> main(List<String> arguments) async {
  if (arguments.isEmpty) {
    print("Please specify an input file");
    return;
  }

  var lines = await File(arguments[0]).readAsLines();
  var crabSwarm = CrabSwarm.parse(lines[0]);
  print("Optimal Position: ${crabSwarm.optimalPosition}");
  print("Optimal Cost: ${crabSwarm.optimalCost}");
}
