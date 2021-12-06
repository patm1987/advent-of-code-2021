import 'package:dive/submarine.dart';
import 'package:vector_math/vector_math.dart';

class AimSubmarine implements Submarine {
  final Vector2 _position = Vector2.zero();
  double _aim = 0.0;

  @override
  getPosition() => _position.clone();

  getAim() => _aim;

  @override
  void down(int i) {
    _aim += i;
  }

  @override
  void forward(int i) {
    _position.x += i;
    _position.y += i * _aim;
  }

  @override
  void up(int i) {
    _aim -= i;
  }
}
