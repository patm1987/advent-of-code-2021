import 'dart:io';

import 'package:giant_squid/bingo_game.dart';
import 'package:giant_squid/board.dart';
import 'package:giant_squid/giant_squid.dart' as giant_squid;

Future<void> main(List<String> arguments) async {
  if (arguments.isEmpty) {
    print("Please pass a file to read");
    return;
  }

  final fileName = arguments[0];
  final fileContents = await File(fileName).readAsString();

  var game = BingoGame.parse(fileContents);
  game.simulateTillLastWin();
  var winner = game.winner;
  print("Winner score: ${winner?.getScore() ?? 'No winner!'}");
}
