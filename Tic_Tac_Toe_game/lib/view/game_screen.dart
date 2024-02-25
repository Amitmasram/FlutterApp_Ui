import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/utils/game_logic.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // Necessary variables
  String lastValue = "X";
  bool gameOver = false;
  int turn = 0;
  String result = "";
  List<int> scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
  Game game = Game();

  @override
  void initState() {
    super.initState();
    game.board = Game.initGameBoard();
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 55, 40, 40),
              Color.fromARGB(255, 0, 0, 0),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            buildTurnText(),
            const SizedBox(height: 20.0),
            buildGameBoard(boardWidth),
            const SizedBox(height: 25.0),
            buildResultText(),
            const SizedBox(height: 30.0),
            buildPlayAgainButton(),
          ],
        ),
      ),
    );
  }

  Widget buildTurnText() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 58,
        ),
        children: [
          const TextSpan(text: "It's "),
          TextSpan(
            text: lastValue,
            style: const TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(text: " turn"),
        ],
      ),
    );
  }

  Widget buildGameBoard(double boardWidth) {
    return SizedBox(
      width: boardWidth,
      height: boardWidth,
      child: GridView.count(
        crossAxisCount: Game.boardlenth ~/ 3,
        padding: const EdgeInsets.all(16.0),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        children: List.generate(Game.boardlenth, (index) {
          return buildGridItem(index);
        }),
      ),
    );
  }

  Widget buildGridItem(int index) {
    return GestureDetector(
      onTap: gameOver
          ? null
          : () {
              handleGridItemClick(index);
            },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        shadowColor: Colors.orange.withOpacity(0.2),
        elevation: 10,
        color: Colors.black54,
        child: Container(
          width: Game.blocSize,
          height: Game.blocSize,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Center(
            child: Text(
              game.board![index],
              style: TextStyle(
                color: game.board![index] == "X" ? Colors.blue : Colors.pink,
                fontSize: 64.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void handleGridItemClick(int index) {
    if (game.board![index] == "") {
      setState(() {
        game.board![index] = lastValue;
        turn++;
        gameOver = game.winnerCheck(lastValue, index, scoreboard, 3);

        if (gameOver) {
          result = "$lastValue the Winner";
        } else if (!gameOver && turn == 9) {
          result = "It's a Draw!";
          gameOver = true;
        }
        lastValue = (lastValue == "X") ? "O" : "X";
      });
    }
  }

  Widget buildResultText() {
    return Text(
      result,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 54.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget buildPlayAgainButton() {
    return ElevatedButton.icon(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
      ),
      onPressed: () {
        resetGame();
      },
      label: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          "Play Again",
          style: GoogleFonts.merriweather(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      icon: const Icon(
        Icons.replay,
        color: Colors.black,
        size: 30,
      ),
    );
  }

  void resetGame() {
    setState(() {
      game.board = Game.initGameBoard();
      lastValue = "X";
      gameOver = false;
      turn = 0;
      result = "";
      scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
    });
  }
}
