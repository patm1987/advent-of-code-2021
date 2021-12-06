import 'board.dart';

class BingoGame {
  Iterable<int> _numbers;
  Iterable<int> get numbers => _numbers;

  List<Board> _boards;
  List<Board> get boards => _boards;

  Board? _winner;
  Board? get winner => _winner;

  BingoGame(Iterable<int> numbers, List<Board> boards)
      : _numbers = numbers,
        _boards = boards;
  factory BingoGame.parse(String input) {
    var split = input.split("\n");
    var numbers = split[0].split(",").map(int.tryParse).whereType<int>();

    // a board is 5x5
    // first line is input
    // then there whould be a newline and five rows

    int numBoards = (split.length - 1) ~/ 6;
    List<Board> boards = [];
    for (int i = 0; i < numBoards; i++) {
      var boardStart = i * 6 + 2;

      var values = split
          .skip(boardStart) // get to the start of the board
          .take(5) // load in one board
          // take every pair and turn into ints, skip one between
          .map((row) => [
                int.parse(row.substring(0, 2)),
                int.parse(row.substring(3, 5)),
                int.parse(row.substring(6, 8)),
                int.parse(row.substring(9, 11)),
                int.parse(row.substring(12))
              ])
          .expand((element) => element);
      boards.add(Board(values.toList()));
    }
    return BingoGame(numbers, boards);
  }

  void simulateUntilEnd() {
    for (var number in _numbers) {
      for (var board in _boards) {
        board.mark(number);
        if (board.won) {
          _winner = board;
          return;
        }
      }
    }
  }

  void simulateTillLastWin() {
    for (var number in _numbers) {
      bool anyBoardLost = false;
      for (var board in _boards) {
        var boardHadWon = board.won;
        board.mark(number);
        if (!board.won) {
          anyBoardLost = true;
        } else if (!boardHadWon) {
          // we want the last board that won, so set that here if it changed
          _winner = board;
        }
      }

      // break out if all boards have won
      if (!anyBoardLost) {
        break;
      }
    }
  }
}
