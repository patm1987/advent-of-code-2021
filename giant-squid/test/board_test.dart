import 'package:giant_squid/board.dart';
import 'package:test/test.dart';

void main() {
  test('Board can mark space', () {
    var board = Board(List.generate(25, (index) => index));
    board.mark(5);
    expect(board.isMarked(0, 1), true);
  });

  test('Board can win horizontally', () {
    var board = Board(List.generate(25, (index) => index));
    board.mark(5);
    board.mark(6);
    board.mark(7);
    board.mark(8);
    board.mark(9);
    expect(board.won, true);
  });

  test('Board can win vertically', () {
    var board = Board(List.generate(25, (index) => index));
    board.mark(1);
    board.mark(6);
    board.mark(11);
    board.mark(16);
    board.mark(21);
    expect(board.won, true);
  });

  test('Board computes score', () {
    var board = Board([
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

    var numbers = [
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

    for (var number in numbers) {
      board.mark(number);
      if (board.won) {
        break;
      }
    }

    expect(board.getScore(), 4512);
  });
}
