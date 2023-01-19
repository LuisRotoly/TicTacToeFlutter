import 'package:flutter/material.dart';
import 'box.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({
    super.key,
    required this.whitchPlayerTurn,
    required this.userName1,
    required this.userName2,
    required this.addPlayerWonGames,
  });

  final String userName1;
  final String userName2;
  final Function whitchPlayerTurn;
  final Function addPlayerWonGames;

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List iconBox = [
    const Icon(Icons.favorite, color: Colors.grey),
    const Icon(Icons.favorite, color: Colors.grey),
    const Icon(Icons.favorite, color: Colors.grey),
    const Icon(Icons.favorite, color: Colors.grey),
    const Icon(Icons.favorite, color: Colors.grey),
    const Icon(Icons.favorite, color: Colors.grey),
    const Icon(Icons.favorite, color: Colors.grey),
    const Icon(Icons.favorite, color: Colors.grey),
    const Icon(Icons.favorite, color: Colors.grey),
  ];
  List box = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  int _countMoves = 0;
  int _playerTurn = 1;

  void won() {
    if (box[0] == 1 && box[1] == 1 && box[2] == 1 ||
        box[3] == 1 && box[4] == 1 && box[5] == 1 ||
        box[6] == 1 && box[7] == 1 && box[8] == 1 ||
        box[0] == 1 && box[3] == 1 && box[6] == 1 ||
        box[1] == 1 && box[4] == 1 && box[7] == 1 ||
        box[2] == 1 && box[5] == 1 && box[8] == 1 ||
        box[0] == 1 && box[4] == 1 && box[8] == 1 ||
        box[2] == 1 && box[4] == 1 && box[6] == 1) {
      widget.addPlayerWonGames("player1");
      showAlert(widget.userName1);
      _clearInputs();
    } else if (box[0] == 2 && box[1] == 2 && box[2] == 2 ||
        box[3] == 2 && box[4] == 2 && box[5] == 2 ||
        box[6] == 2 && box[7] == 2 && box[8] == 2 ||
        box[0] == 2 && box[3] == 2 && box[6] == 2 ||
        box[1] == 2 && box[4] == 2 && box[7] == 2 ||
        box[2] == 2 && box[5] == 2 && box[8] == 2 ||
        box[0] == 2 && box[4] == 2 && box[8] == 2 ||
        box[2] == 2 && box[4] == 2 && box[6] == 2) {
      widget.addPlayerWonGames("player2");
      showAlert(widget.userName2);
      _clearInputs();
    } else if (_countMoves == 9) {
      showAlert("draw");
      _clearInputs();
    }
  }

  void showAlert(String user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              (user == "draw") ? const Text("Empate") : const Text("Parabéns!"),
          content: (user == "draw")
              ? const Text("Essa partida resultou em empate")
              : Text("O jogador $user ganhou essa partida"),
          actions: <Widget>[
            TextButton(
              child: const Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _boxClicked() {
    if (_playerTurn == 1) {
      setState(() {
        _playerTurn = 2;
      });
      widget.whitchPlayerTurn(2);
    } else {
      setState(() {
        _playerTurn = 1;
      });
      widget.whitchPlayerTurn(1);
    }
    _countMoves++;
    won();
  }

  void _clearInputs() {
    iconBox = [
      const Icon(Icons.favorite, color: Colors.grey),
      const Icon(Icons.favorite, color: Colors.grey),
      const Icon(Icons.favorite, color: Colors.grey),
      const Icon(Icons.favorite, color: Colors.grey),
      const Icon(Icons.favorite, color: Colors.grey),
      const Icon(Icons.favorite, color: Colors.grey),
      const Icon(Icons.favorite, color: Colors.grey),
      const Icon(Icons.favorite, color: Colors.grey),
      const Icon(Icons.favorite, color: Colors.grey),
    ];
    box = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    _countMoves = 0;
    _playerTurn = 1;
    widget.whitchPlayerTurn(1);
  }

  void _changeBoxValue(int boxNumber, int value) {
    setState(() {
      box[boxNumber] = value;
    });
  }

  void _changeIconBox(int iconNumber, Icon value) {
    setState(() {
      iconBox[iconNumber] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Box(
              playerTurn: _playerTurn,
              boxNumber: 0,
              boxValues: box,
              iconBox: iconBox[0],
              iconNumber: 0,
              boxClicked: _boxClicked,
              changeBoxValue: _changeBoxValue,
              changeIconBox: _changeIconBox,
            ),
            const SizedBox(
              height: 60.0,
              child: VerticalDivider(
                color: Colors.white,
                thickness: 5,
              ),
            ),
            Box(
              playerTurn: _playerTurn,
              boxNumber: 1,
              boxValues: box,
              iconBox: iconBox[1],
              iconNumber: 1,
              boxClicked: _boxClicked,
              changeBoxValue: _changeBoxValue,
              changeIconBox: _changeIconBox,
            ),
            const SizedBox(
              height: 60.0,
              child: VerticalDivider(
                color: Colors.white,
                thickness: 5,
              ),
            ),
            Box(
              playerTurn: _playerTurn,
              boxNumber: 2,
              boxValues: box,
              iconBox: iconBox[2],
              iconNumber: 2,
              boxClicked: _boxClicked,
              changeBoxValue: _changeBoxValue,
              changeIconBox: _changeIconBox,
            ),
          ],
        ),
        const SizedBox(
          width: 250.0,
          child: Divider(
            color: Colors.white,
            thickness: 5,
            height: 0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Box(
              playerTurn: _playerTurn,
              boxNumber: 3,
              boxValues: box,
              iconBox: iconBox[3],
              iconNumber: 3,
              boxClicked: _boxClicked,
              changeBoxValue: _changeBoxValue,
              changeIconBox: _changeIconBox,
            ),
            const SizedBox(
              height: 60.0,
              child: VerticalDivider(
                color: Colors.white,
                thickness: 5,
              ),
            ),
            Box(
              playerTurn: _playerTurn,
              boxNumber: 4,
              boxValues: box,
              iconBox: iconBox[4],
              iconNumber: 4,
              boxClicked: _boxClicked,
              changeBoxValue: _changeBoxValue,
              changeIconBox: _changeIconBox,
            ),
            const SizedBox(
              height: 60.0,
              child: VerticalDivider(
                color: Colors.white,
                thickness: 5,
              ),
            ),
            Box(
              playerTurn: _playerTurn,
              boxNumber: 5,
              boxValues: box,
              iconBox: iconBox[5],
              iconNumber: 5,
              boxClicked: _boxClicked,
              changeBoxValue: _changeBoxValue,
              changeIconBox: _changeIconBox,
            ),
          ],
        ),
        const SizedBox(
          width: 250.0,
          child: Divider(
            color: Colors.white,
            thickness: 5,
            height: 0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Box(
              playerTurn: _playerTurn,
              boxNumber: 6,
              boxValues: box,
              iconBox: iconBox[6],
              iconNumber: 6,
              boxClicked: _boxClicked,
              changeBoxValue: _changeBoxValue,
              changeIconBox: _changeIconBox,
            ),
            const SizedBox(
              height: 60.0,
              child: VerticalDivider(
                color: Colors.white,
                thickness: 5,
              ),
            ),
            Box(
              playerTurn: _playerTurn,
              boxNumber: 7,
              boxValues: box,
              iconBox: iconBox[7],
              iconNumber: 7,
              boxClicked: _boxClicked,
              changeBoxValue: _changeBoxValue,
              changeIconBox: _changeIconBox,
            ),
            const SizedBox(
              height: 60.0,
              child: VerticalDivider(
                color: Colors.white,
                thickness: 5,
              ),
            ),
            Box(
              playerTurn: _playerTurn,
              boxNumber: 8,
              boxValues: box,
              iconBox: iconBox[8],
              iconNumber: 8,
              boxClicked: _boxClicked,
              changeBoxValue: _changeBoxValue,
              changeIconBox: _changeIconBox,
            ),
          ],
        ),
      ],
    );
  }
}
