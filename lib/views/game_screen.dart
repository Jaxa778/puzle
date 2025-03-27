import 'package:flutter/material.dart';
import 'package:puzle/controllers/game_controller.dart';

class GameScreen extends StatefulWidget {
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  GameController gameController = GameController();

  @override
  void initState() {
    super.initState();
    gameController.startGame();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        padding: EdgeInsets.all(10),
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          ...List.generate(16, (index) {
            String title = gameController.model.numbers[index].toString();
            return GestureDetector(
              onTap: () {
                gameController.checkOut(index);
                gameController.checkWin();
                setState(() {});
              },
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
