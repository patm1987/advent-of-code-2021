class Lanternfish {
  static const int _spawnDelay = 6;
  static const int _initialSpawnDelay = 8;

  final List<int> _state;

  Lanternfish(List<int> startingState) : _state = startingState;

  Iterable<int> get state => _state;
  int get count => _state.length;

  void advance(int days) {
    for (var i = 0; i < days; i++) {
      _advance();
    }
  }

  void _advance() {
    int newFish = 0;
    for (int i = 0; i < _state.length; i++) {
      _state[i]--;
      if (_state[i] < 0) {
        _state[i] = _spawnDelay;
        newFish++;
      }
    }
    if (newFish > 0) {
      _state.addAll(List.filled(newFish, _initialSpawnDelay));
    }
  }

  factory Lanternfish.parse(String input) {
    return Lanternfish(input.split(',').map((e) => int.parse(e)).toList());
  }
}
