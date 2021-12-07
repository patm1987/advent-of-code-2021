class Lanternfish {
  List<int> _state;

  Lanternfish(List<int> startingState) : _state = startingState;

  Iterable<int> get state => _state;

  void advance(int days) {
    for (int i = 0; i < _state.length; i++) {
      _state[i]--;
    }
  }
}
