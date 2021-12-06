import 'package:vector_math/vector_math.dart';

class Submarine {
  final Vector2 _position = Vector2.zero();
  Vector2 getPosition() => _position.clone();

  void forward(int i) {
    _position.x += i;
  }

  void down(int i) {
    _position.y += i;
  }

  void up(int i) {
    _position.y -= i;
  }
}
