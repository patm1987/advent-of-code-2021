import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:the_treachery_of_whales/crab_swarm.dart';

void main() {
  test('Test operates on sample input', () {
    var crabSwarm = CrabSwarm([16, 1, 2, 0, 4, 2, 7, 1, 2, 14]);
    expect(crabSwarm.optimalPosition, 2);
  });
}
