/// Counts the number of times the numbers go up in an input [depthMap]
int countIncreases(List<int> depthMap, {int window = 1}) {
  if (depthMap.length < window) {
    return 0;
  }

  int last = 0;
  for (int i = 0; i < window; i++) {
    last += depthMap[i];
  }

  var increases = 0;
  for (int start = 1, end = window + 1;
      end <= depthMap.length;
      start++, end++) {
    int current = 0;
    for (int i = start; i < end; i++) {
      current += depthMap[i];
    }

    if (current > last) {
      increases++;
    }

    last = current;
  }

  return increases;
}

/// Parses input string [data] as a depth map
List<int> parseString(String data) {
  return data
      .split('\n') // split into lines
      .map((e) => int.tryParse(e)) // try to read as ints
      .whereType<int>() // drop everything that isn't an int (failed to parse)
      .toList();
}
