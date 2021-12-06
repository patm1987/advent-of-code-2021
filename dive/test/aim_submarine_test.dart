import 'package:dive/aim_submarine.dart';
import 'package:test/test.dart';
import 'package:vector_math/vector_math.dart';

void main() {
  test('Test initializes aim submarine', () {
    var submarine = AimSubmarine();
    expect(submarine.getPosition(), Vector2.zero());
    expect(submarine.getAim(), 0.0);
  });

  test('Test forward moves forward', () {
    var submarine = AimSubmarine();
    submarine.forward(1);
    expect(submarine.getPosition(), Vector2(1, 0));
  });

  test('Test down increases aim', () {
    var submarine = AimSubmarine();
    submarine.down(1);
    expect(submarine.getAim(), 1);
  });

  test('Test up decreases aim', () {
    var submarine = AimSubmarine();
    submarine.up(1);
    expect(submarine.getAim(), -1);
  });

  test('Test forward increses depth', () {
    var submarine = AimSubmarine();
    submarine.down(5);
    submarine.forward(1);
    expect(submarine.getAim(), 5);
    expect(submarine.getPosition(), Vector2(1, 5));
  });
}
