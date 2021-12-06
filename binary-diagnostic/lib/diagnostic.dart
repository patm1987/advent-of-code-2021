class Diagnostic {
  int _gammaRate = 0;
  int _epsilonRate = 0;
  int _oxygenGeneratorRating = 0;
  int _co2ScrubberRating = 0;

  int get gammaRate => _gammaRate;
  int get epsilonRate => _epsilonRate;
  int get oxygenGeneratorRating => _oxygenGeneratorRating;
  int get co2ScrubberRating => _co2ScrubberRating;

  Diagnostic(List<String> input) {
    // for every bit, a 1 increases the counter and a 0 decreases
    // if the number is positive, it's a 1
    // if the number is negative, it's a 0
    var width = input[0].length;
    var accumulators = computeMostCommonBits(input);

    // convert to binary
    for (var accumulator in accumulators) {
      _gammaRate <<= 1;
      _epsilonRate <<= 1;
      if (accumulator > 0) {
        _gammaRate |= 1;
      } else {
        _epsilonRate |= 1;
      }
    }

    // oxygen: only keep most common bit. Ties resolve to 1
    List<String> oxygenList = List.from(input);
    for (int i = 0; i < width && oxygenList.length > 1; i++) {
      accumulators = computeMostCommonBits(oxygenList);
      oxygenList.removeWhere((element) {
        if (accumulators[i] >= 0) {
          // keep 1's
          return element.split('')[i] == "0";
        } else {
          // keep 0's
          return element.split('')[i] == "1";
        }
      });
    }

    for (var character in oxygenList.first.split('')) {
      _oxygenGeneratorRating <<= 1;
      if (character == "1") {
        _oxygenGeneratorRating |= 1;
      }
    }

    // co2: only keep least common bit. Ties resolve to 0
    List<String> co2List = List.from(input);
    for (int i = 0; i < width && co2List.length > 1; i++) {
      accumulators = computeMostCommonBits(co2List);
      co2List.removeWhere((element) {
        if (accumulators[i] >= 0) {
          // keep 1's
          return element.split('')[i] == "1";
        } else {
          // keep 0's
          return element.split('')[i] == "0";
        }
      });
    }

    for (var character in co2List.first.split('')) {
      _co2ScrubberRating <<= 1;
      if (character == "1") {
        _co2ScrubberRating |= 1;
      }
    }
  }

  static List<int> computeMostCommonBits(Iterable<String> input) {
    var width = input.first.length;
    var accumulators = List.filled(width, 0);
    for (var word in input) {
      var characters = word.split('');
      for (int i = 0; i < width; i++) {
        if (characters[i] == "1") {
          accumulators[i]++;
        } else if (characters[i] == "0") {
          accumulators[i]--;
        }
      }
    }
    return accumulators;
  }
}
