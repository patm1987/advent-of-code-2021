import 'dart:math';

class Line {
  Point<int> start;
  Point<int> end;

  Line(this.start, this.end);

  factory Line.parse(String s) {
    var points = s.split('->');
    var start = points[0].split(',');
    var end = points[1].split(',');
    return Line(Point(int.parse(start[0]), int.parse(start[1])),
        Point(int.parse(end[0]), int.parse(end[1])));
  }

  @override
  bool operator ==(Object other) {
    if (other is! Line) {
      return false;
    }

    return start == other.start && end == other.end;
  }

  @override
  int get hashCode => Object.hashAll([start, end]);

  @override
  String toString() {
    return "${start.x},${start.y} -> ${end.x},${end.y}";
  }
}
