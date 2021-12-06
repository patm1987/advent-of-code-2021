class Board {
  static const numSpaces = 25;
  static const width = 5;
  static const height = 5;

  final List<int> _numbers;
  final List<bool> _scores;

  bool _won = false;
  bool get won => _won;

  int _lastNumber = 0;

  Board(List<int> numbers)
      : _numbers = numbers,
        _scores = List.filled(numSpaces, false);

  @override
  bool operator ==(Object other) {
    if (other is! Board) {
      return false;
    }
    if (_numbers.length != other._numbers.length) {
      return false;
    }
    for (int i = 0; i < _numbers.length; i++) {
      if (_numbers[i] != other._numbers[i]) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode =>
      _numbers.fold(0, (previousValue, element) => previousValue ^ element);

  void mark(int number) {
    _lastNumber = number;
    for (int i = 0; i < numSpaces; i++) {
      if (_numbers[i] == number) {
        _scores[i] = true;
        // could early terminate, but won't for safety
      }
    }
    _checkWinner();
  }

  void _checkWinner() {
    // check for horizontal wins
    int startIndex = 0;
    for (int row = 0; row < height; row++, startIndex += width) {
      int index = startIndex;
      for (int col = 0; col < width; col++, index++) {
        if (!_scores[index]) {
          // a space was missing in this row, go to the next
          break;
        }
        if (col == width - 1) {
          // a whole row was marked
          _won = true;
          return;
        }
      }
    }

    // check vertical wins
    startIndex = 0;
    for (int col = 0; col < width; col++, startIndex++) {
      int index = startIndex;
      for (int row = 0; row < height; row++, index += width) {
        if (!_scores[index]) {
          // a missing score in this column, skip
          break;
        }
        if (row == height - 1) {
          // at the last row in the column, pass!
          _won = true;
          return;
        }
      }
    }
    _won = false;
  }

  bool isMarked(int x, int y) {
    return _scores[x + y * width];
  }

  int getScore() {
    int unmarkedSum = 0;
    for (int i = 0; i < numSpaces; i++) {
      if (!_scores[i]) {
        unmarkedSum += _numbers[i];
      }
    }
    return unmarkedSum * _lastNumber;
  }
}
