import 'package:flutter/material.dart';

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
  List icons = [
    const Icon(Icons.clear_outlined),
    const Icon(Icons.circle_outlined),
  ];
  var iconSelector0 = const Icon(Icons.favorite, color: Colors.grey);
  var iconSelector1 = const Icon(Icons.favorite, color: Colors.grey);
  var iconSelector2 = const Icon(Icons.favorite, color: Colors.grey);
  var iconSelector3 = const Icon(Icons.favorite, color: Colors.grey);
  var iconSelector4 = const Icon(Icons.favorite, color: Colors.grey);
  var iconSelector5 = const Icon(Icons.favorite, color: Colors.grey);
  var iconSelector6 = const Icon(Icons.favorite, color: Colors.grey);
  var iconSelector7 = const Icon(Icons.favorite, color: Colors.grey);
  var iconSelector8 = const Icon(Icons.favorite, color: Colors.grey);
  var box0 = 0;
  var box1 = 0;
  var box2 = 0;
  var box3 = 0;
  var box4 = 0;
  var box5 = 0;
  var box6 = 0;
  var box7 = 0;
  var box8 = 0;
  int _countMoves = 0;
  int _playerTurn = 1;

  void won() {
    if (box0 == 1 && box1 == 1 && box2 == 1 ||
        box3 == 1 && box4 == 1 && box5 == 1 ||
        box6 == 1 && box7 == 1 && box8 == 1 ||
        box0 == 1 && box3 == 1 && box6 == 1 ||
        box1 == 1 && box4 == 1 && box7 == 1 ||
        box2 == 1 && box5 == 1 && box8 == 1 ||
        box0 == 1 && box4 == 1 && box8 == 1 ||
        box2 == 1 && box4 == 1 && box6 == 1) {
      widget.addPlayerWonGames("player1");
      showAlert(widget.userName1);
      _clearInputs();
    } else if (box0 == 2 && box1 == 2 && box2 == 2 ||
        box3 == 2 && box4 == 2 && box5 == 2 ||
        box6 == 2 && box7 == 2 && box8 == 2 ||
        box0 == 2 && box3 == 2 && box6 == 2 ||
        box1 == 2 && box4 == 2 && box7 == 2 ||
        box2 == 2 && box5 == 2 && box8 == 2 ||
        box0 == 2 && box4 == 2 && box8 == 2 ||
        box2 == 2 && box4 == 2 && box6 == 2) {
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
    iconSelector0 = const Icon(Icons.favorite, color: Colors.grey);
    iconSelector1 = const Icon(Icons.favorite, color: Colors.grey);
    iconSelector2 = const Icon(Icons.favorite, color: Colors.grey);
    iconSelector3 = const Icon(Icons.favorite, color: Colors.grey);
    iconSelector4 = const Icon(Icons.favorite, color: Colors.grey);
    iconSelector5 = const Icon(Icons.favorite, color: Colors.grey);
    iconSelector6 = const Icon(Icons.favorite, color: Colors.grey);
    iconSelector7 = const Icon(Icons.favorite, color: Colors.grey);
    iconSelector8 = const Icon(Icons.favorite, color: Colors.grey);
    box0 = 0;
    box1 = 0;
    box2 = 0;
    box3 = 0;
    box4 = 0;
    box5 = 0;
    box6 = 0;
    box7 = 0;
    box8 = 0;
    _countMoves = 0;
    _playerTurn = 1;
    widget.whitchPlayerTurn(1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                if (box0 == 0) {
                  box0 = _playerTurn;
                  if (_playerTurn == 1) {
                    setState(() {
                      iconSelector0 = icons[0];
                    });
                  } else {
                    setState(() {
                      iconSelector0 = icons[1];
                    });
                  }
                  _boxClicked();
                }
              },
              iconSize: 60.0,
              icon: iconSelector0,
            ),
            const SizedBox(
              height: 60.0,
              child: VerticalDivider(
                color: Colors.white,
                thickness: 5,
              ),
            ),
            IconButton(
              onPressed: () {
                if (box1 == 0) {
                  box1 = _playerTurn;
                  if (_playerTurn == 1) {
                    setState(() {
                      iconSelector1 = icons[0];
                    });
                  } else {
                    setState(() {
                      iconSelector1 = icons[1];
                    });
                  }
                  _boxClicked();
                }
              },
              iconSize: 60.0,
              icon: iconSelector1,
            ),
            const SizedBox(
              height: 60.0,
              child: VerticalDivider(
                color: Colors.white,
                thickness: 5,
              ),
            ),
            IconButton(
              onPressed: () {
                if (box2 == 0) {
                  box2 = _playerTurn;
                  if (_playerTurn == 1) {
                    setState(() {
                      iconSelector2 = icons[0];
                    });
                  } else {
                    setState(() {
                      iconSelector2 = icons[1];
                    });
                  }
                  _boxClicked();
                }
              },
              iconSize: 60.0,
              icon: iconSelector2,
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
            IconButton(
              onPressed: () {
                if (box3 == 0) {
                  box3 = _playerTurn;
                  if (_playerTurn == 1) {
                    setState(() {
                      iconSelector3 = icons[0];
                    });
                  } else {
                    setState(() {
                      iconSelector3 = icons[1];
                    });
                  }
                  _boxClicked();
                }
              },
              iconSize: 60.0,
              icon: iconSelector3,
            ),
            const SizedBox(
              height: 60.0,
              child: VerticalDivider(
                color: Colors.white,
                thickness: 5,
              ),
            ),
            IconButton(
              onPressed: () {
                if (box4 == 0) {
                  box4 = _playerTurn;
                  if (_playerTurn == 1) {
                    setState(() {
                      iconSelector4 = icons[0];
                    });
                  } else {
                    setState(() {
                      iconSelector4 = icons[1];
                    });
                  }
                  _boxClicked();
                }
              },
              iconSize: 60.0,
              icon: iconSelector4,
            ),
            const SizedBox(
              height: 60.0,
              child: VerticalDivider(
                color: Colors.white,
                thickness: 5,
              ),
            ),
            IconButton(
              onPressed: () {
                if (box5 == 0) {
                  box5 = _playerTurn;
                  if (_playerTurn == 1) {
                    setState(() {
                      iconSelector5 = icons[0];
                    });
                  } else {
                    setState(() {
                      iconSelector5 = icons[1];
                    });
                  }
                  _boxClicked();
                }
              },
              iconSize: 60.0,
              icon: iconSelector5,
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
            IconButton(
              onPressed: () {
                if (box6 == 0) {
                  box6 = _playerTurn;
                  if (_playerTurn == 1) {
                    setState(() {
                      iconSelector6 = icons[0];
                    });
                  } else {
                    setState(() {
                      iconSelector6 = icons[1];
                    });
                  }
                  _boxClicked();
                }
              },
              iconSize: 60.0,
              icon: iconSelector6,
            ),
            const SizedBox(
              height: 60.0,
              child: VerticalDivider(
                color: Colors.white,
                thickness: 5,
              ),
            ),
            IconButton(
              onPressed: () {
                if (box7 == 0) {
                  box7 = _playerTurn;
                  if (_playerTurn == 1) {
                    setState(() {
                      iconSelector7 = icons[0];
                    });
                  } else {
                    setState(() {
                      iconSelector7 = icons[1];
                    });
                  }
                  _boxClicked();
                }
              },
              iconSize: 60.0,
              icon: iconSelector7,
            ),
            const SizedBox(
              height: 60.0,
              child: VerticalDivider(
                color: Colors.white,
                thickness: 5,
              ),
            ),
            IconButton(
              onPressed: () {
                if (box8 == 0) {
                  box8 = _playerTurn;
                  if (_playerTurn == 1) {
                    setState(() {
                      iconSelector8 = icons[0];
                    });
                  } else {
                    setState(() {
                      iconSelector8 = icons[1];
                    });
                  }
                  _boxClicked();
                }
              },
              iconSize: 60.0,
              icon: iconSelector8,
            ),
          ],
        ),
      ],
    );
  }
}
