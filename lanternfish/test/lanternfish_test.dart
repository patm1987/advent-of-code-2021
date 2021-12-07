import 'package:lanternfish/lanternfish.dart';
import 'package:test/test.dart';

void main() {
  test('Initializing from test', () {
    var lanternfish = Lanternfish([1, 2, 3]);
    expect(lanternfish.state, [1, 2, 3]);
  });

  test('Advances one day', () {
    var lanternfish = Lanternfish([1, 2, 3]);
    lanternfish.advance(1);
    expect(lanternfish.state, [0, 1, 2]);
  });
}
