import 'package:puzle/models/game_models.dart';

class GameController {
  GameModels model = GameModels();

  void startGame() {
    model.numbers = List.generate(16, (indexx) {
      return indexx == 15 ? "" : (indexx + 1).toString();
    });

    model.numbers.shuffle();
  }

  void checkOut(int index) {
    List.empty();
    List numbers = model.numbers;
    if (index % 4 != 0 && (index - 1) >= 0) {
      if (numbers[index - 1] == "") {
        numbers[index - 1] = numbers[index];
        numbers[index] = "";
      }
    }

    if ((index + 1) % 4 != 0 && (index + 1) < 16) {
      if (numbers[index + 1] == "") {
        numbers[index + 1] = numbers[index];
        numbers[index] = "";
      }
    }
    if (index - 4 >= 0) {
      if (numbers[index - 4] == "") {
        numbers[index - 4] = numbers[index];
        numbers[index] = "";
      }
    }

    if (index + 4 <= 16) {
      if (numbers[index + 4] == "") {
        numbers[index + 4] = numbers[index];
        numbers[index] = "";
      }
    }
  }

  void checkWin() {
    if (model.numbers.join("") == "123456789101112131415") {}
  }
}
