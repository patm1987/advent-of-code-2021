import 'dart:io';
import 'dart:math';

import 'line.dart';

class VentMap {
  late int width;
  late int height;

  late List<int> _map;

  VentMap(List<Line> lines) {
    int maxX = 0;
    int maxY = 0;
    for (var line in lines) {
      // I'm expecting positive numbers
      assert(line.start.x >= 0);
      assert(line.start.y >= 0);
      assert(line.end.x >= 0);
      assert(line.end.y >= 0);

      if (line.start.x > maxX) {
        maxX = line.start.x;
      }
      if (line.start.y > maxY) {
        maxY = line.start.y;
      }
      if (line.end.x > maxX) {
        maxX = line.end.x;
      }
      if (line.end.y > maxY) {
        maxY = line.end.y;
      }
    }

    // 0 is a space, so add 1
    width = maxX + 1;
    height = maxY + 1;

    _map = List.filled(width * height, 0);

    for (var line in lines) {
      var startPoint = line.start;
      var endPoint = line.end;
      var delta = endPoint - startPoint;

      var steps = max(delta.x.abs(), delta.y.abs());
      var step = Point(delta.x ~/ steps, delta.y ~/ steps);

      var startIndex = startPoint.x + startPoint.y * width;
      var stepIndex = step.x + step.y * width;
      for (int i = 0; i <= steps; i++) {
        _map[startIndex + i * stepIndex]++;
      }
    }
  }

  factory VentMap.parseLines(List<String> lines) {
    var parsedLines = lines
        .where((element) => element.isNotEmpty)
        .map((e) => Line.parse(e))
        .toList();
    return VentMap(parsedLines);
  }

  int get(int x, int y) => _map[x + y * width];

  int countOverlaps() {
    int sum = 0;
    for (var cell in _map) {
      if (cell >= 2) {
        sum++;
      }
    }
    return sum;
  }

  @override
  String toString() {
    String out = "";
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        if (x == width - 1) {
          out += "${get(x, y)}\n";
        } else {
          out += "${get(x, y)}";
        }
      }
    }
    return out;
  }
}
