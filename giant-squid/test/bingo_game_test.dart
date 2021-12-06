import 'dart:io';

import 'package:giant_squid/bingo_game.dart';
import 'package:giant_squid/board.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('Test parses numbers', () async {
    var input = await File("test/test_input.txt").readAsString();
    var game = BingoGame.parse(input);
    final expected = [
      7,
      4,
      9,
      5,
      11,
      17,
      23,
      2,
      0,
      14,
      21,
      24,
      10,
      16,
      13,
      6,
      15,
      25,
      12,
      22,
      18,
      20,
      8,
      19,
      3,
      26,
      1
    ];
    expect(game.numbers, orderedEquals(expected));
  });

  test("test reads three boards", () async {
    var input = await File("test/test_input.txt").readAsString();
    var game = BingoGame.parse(input);
    expect(game.boards.length, 3);
  });

  test("test reads first board", () async {
    var input = await File("test/test_input.txt").readAsString();
    var game = BingoGame.parse(input);
    var expected = Board([
      22,
      13,
      17,
      11,
      0,
      8,
      2,
      23,
      4,
      24,
      21,
      9,
      14,
      16,
      7,
      6,
      10,
      3,
      18,
      5,
      1,
      12,
      20,
      15,
      19
    ]);
    expect(game.boards[0], equals(expected));
  });

  test("simulates to win", () async {
    var input = await File("test/test_input.txt").readAsString();
    var game = BingoGame.parse(input);
    var expected = Board([
      14,
      21,
      17,
      24,
      4,
      10,
      16,
      15,
      9,
      19,
      18,
      8,
      23,
      26,
      20,
      22,
      11,
      13,
      6,
      5,
      2,
      0,
      12,
      3,
      7
    ]);
    game.simulateUntilEnd();
    expect(game.winner, equals(expected));
  });
}
