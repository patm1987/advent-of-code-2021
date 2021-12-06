import 'package:dive/submarine.dart';

class CommandParser {
  final Submarine _submarine;

  CommandParser(Submarine submarine) : _submarine = submarine;

  void parseCommand(String command) {
    var splitCommand = command.split(' ');

    // ignore commands that are "operator amount"
    if (splitCommand.length != 2) {
      return;
    }

    var operator = splitCommand[0];
    var amount = int.tryParse(splitCommand[1]);

    if (amount == null) {
      return;
    }

    switch (operator) {
      case "forward":
        _submarine.forward(amount);
        break;
      case "down":
        _submarine.down(amount);
        break;
      case "up":
        _submarine.up(amount);
        break;
    }
  }
}
