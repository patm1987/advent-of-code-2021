class Lanternfish {
  static const int _spawnDelay = 6;
  static const int _initialSpawnDelay = 8;

  // each day gets a bucket
  final List<int> _state = List.filled(_initialSpawnDelay + 1, 0);

  Lanternfish(List<int> startingState) {
    for (var fish in startingState) {
      // add the fish to the right bucket
      _state[fish]++;
    }
  }

  Iterable<int> get state => _state;
  int get count {
    int sum = 0;
    for (var fish in _state) {
      sum += fish;
    }
    return sum;
  }

  void advance(int days) {
    for (var i = 0; i < days; i++) {
      _advance();
    }
  }

  void _advance() {
    var newFish = _state[0];
    // shift all the counts over
    for (int i = 1; i < _state.length; i++) {
      _state[i - 1] = _state[i];
    }

    // merge the fish that just spawned with the incoming fish
    _state[_spawnDelay] += newFish;

    // add more incoming fish
    _state[_initialSpawnDelay] = newFish;
  }

  factory Lanternfish.parse(String input) {
    return Lanternfish(input.split(',').map((e) => int.parse(e)).toList());
  }
}
