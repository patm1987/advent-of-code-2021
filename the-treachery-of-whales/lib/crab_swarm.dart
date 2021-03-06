class CrabSwarm {
  int _optimalPosition = 0;
  int _optimalCost = 0;

  CrabSwarm(List<int> crabs) {
    List<int> positions = [];

    for (var crab in crabs) {
      if (crab >= positions.length) {
        // grow to fit the new position
        positions = [
          ...positions,
          for (var i = positions.length; i < crab + 1; i++) 0
        ];
      }
      positions[crab]++;
    }

    var costs = List.filled(positions.length, 0);

    // cost to each cell in the grid is the distance from each other cell times
    // the number of crabs in it
    for (int target = 0; target < costs.length; target++) {
      for (int test = 0; test < costs.length; test++) {
        costs[target] += computeCost((test - target).abs()) * positions[test];
      }
    }

    _optimalPosition = 0;
    for (int i = 1; i < costs.length; i++) {
      if (costs[i] < costs[_optimalPosition]) {
        _optimalPosition = i;
      }
    }

    _optimalCost = costs[_optimalPosition];
  }

  int computeCost(int distance) {
    int sum = 0;
    for (int i = 1; i <= distance; i++) {
      sum += i;
    }
    return sum;
  }

  factory CrabSwarm.parse(String input) {
    return CrabSwarm(input.split(',').map((e) => int.parse(e)).toList());
  }

  int get optimalPosition => _optimalPosition;

  int get optimalCost => _optimalCost;
}
