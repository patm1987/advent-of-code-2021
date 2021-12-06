import 'package:dive/submarine.dart';
import 'package:test/test.dart';
import 'package:vector_math/vector_math.dart';

void main() {
  test('Starts at origin', () {
    expect(Submarine().getPosition(), Vector2.zero());
  });

  test('forward goes forward', () {
    var submarine = Submarine();
    submarine.forward(1);
    expect(submarine.getPosition().x, 1);
  });

  test('down increases depth', () {
    var submarine = Submarine();
    submarine.down(1);
    expect(submarine.getPosition().y, 1);
  });

  test('up decreases depth', () {
    var submarine = Submarine();
    submarine.up(1);
    expect(submarine.getPosition().y, -1);
  });
}
