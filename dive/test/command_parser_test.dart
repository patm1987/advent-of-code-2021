import 'package:dive/aim_submarine.dart';
import 'package:dive/command_parser.dart';
import 'package:dive/submarine.dart';
import 'package:test/test.dart';
import 'package:vector_math/vector_math.dart';

main() {
  test('Parses forward command', () {
    var submarine = Submarine();
    var parser = CommandParser(submarine);
    parser.parseCommand('forward 5');
    final expectedPosition = Vector2(5, 0);
    expect(submarine.getPosition(), expectedPosition);
  });

  test('Ignores empty command', () {
    var submarine = Submarine();
    var parser = CommandParser(submarine);
    parser.parseCommand("");
  });

  test('Ignores bad amount in command', () {
    var submarine = Submarine();
    var parser = CommandParser(submarine);
    parser.parseCommand("forward likeaninja");
  });

  test('Parses down command', () {
    var submarine = Submarine();
    var parser = CommandParser(submarine);
    parser.parseCommand("down 5");
    final expected = Vector2(0, 5);
    expect(submarine.getPosition(), expected);
  });

  test('Parses up command', () {
    var submarine = Submarine();
    var parser = CommandParser(submarine);
    parser.parseCommand("up 3");
    final expected = Vector2(0, -3);
    expect(submarine.getPosition(), expected);
  });

  test('Parses sample commands', () {
    const commands = """
forward 5
down 5
forward 8
up 3
down 8
forward 2
    """;
    var submarine = Submarine();
    var parser = CommandParser(submarine);
    commands.split("\n").forEach((command) {
      parser.parseCommand(command);
    });
    final expected = Vector2(15, 10);
    expect(submarine.getPosition(), expected);
  });

  test("parses sample command for problem 2", () {
    const commands = """
forward 5
down 5
forward 8
up 3
down 8
forward 2
    """;
    var submarine = AimSubmarine();
    var parser = CommandParser(submarine);
    commands.split('\n').forEach(parser.parseCommand);
    expect(submarine.getPosition(), Vector2(15, 60));
  });
}
