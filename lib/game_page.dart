import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({
    super.key,
    required this.userName,
    required this.userName2,
  });

  final String userName;
  final String userName2;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var playerTurn = 1;
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
  var countMoves = 0;
  var box0 = 0;
  var box1 = 0;
  var box2 = 0;
  var box3 = 0;
  var box4 = 0;
  var box5 = 0;
  var box6 = 0;
  var box7 = 0;
  var box8 = 0;
  var gamesPlayer2 = 0;
  var gamesPlayer1 = 0;

  void boxClicked() {
    if (playerTurn == 1) {
      playerTurn = 2;
    } else {
      playerTurn = 1;
    }
    countMoves++;
    won();
  }

  void clearInputs() {
    playerTurn = 1;
    iconSelector0 = const Icon(Icons.favorite, color: Colors.grey);
    iconSelector1 = const Icon(Icons.favorite, color: Colors.grey);
    iconSelector2 = const Icon(Icons.favorite, color: Colors.grey);
    iconSelector3 = const Icon(Icons.favorite, color: Colors.grey);
    iconSelector4 = const Icon(Icons.favorite, color: Colors.grey);
    iconSelector5 = const Icon(Icons.favorite, color: Colors.grey);
    iconSelector6 = const Icon(Icons.favorite, color: Colors.grey);
    iconSelector7 = const Icon(Icons.favorite, color: Colors.grey);
    iconSelector8 = const Icon(Icons.favorite, color: Colors.grey);
    countMoves = 0;
    box0 = 0;
    box1 = 0;
    box2 = 0;
    box3 = 0;
    box4 = 0;
    box5 = 0;
    box6 = 0;
    box7 = 0;
    box8 = 0;
  }

  void won() {
    if (box0 == 1 && box1 == 1 && box2 == 1 ||
        box3 == 1 && box4 == 1 && box5 == 1 ||
        box6 == 1 && box7 == 1 && box8 == 1 ||
        box0 == 1 && box3 == 1 && box6 == 1 ||
        box1 == 1 && box4 == 1 && box7 == 1 ||
        box2 == 1 && box5 == 1 && box8 == 1 ||
        box0 == 1 && box4 == 1 && box8 == 1 ||
        box2 == 1 && box4 == 1 && box6 == 1) {
      showAlert(widget.userName2);
      gamesPlayer2++;
      clearInputs();
    } else if (box0 == 2 && box1 == 2 && box2 == 2 ||
        box3 == 2 && box4 == 2 && box5 == 2 ||
        box6 == 2 && box7 == 2 && box8 == 2 ||
        box0 == 2 && box3 == 2 && box6 == 2 ||
        box1 == 2 && box4 == 2 && box7 == 2 ||
        box2 == 2 && box5 == 2 && box8 == 2 ||
        box0 == 2 && box4 == 2 && box8 == 2 ||
        box2 == 2 && box4 == 2 && box6 == 2) {
      showAlert(widget.userName);
      gamesPlayer1++;
      clearInputs();
    } else if (countMoves == 9) {
      showAlert("draw");
      clearInputs();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 100.0,
              ),
              const Text(
                "É a vez do jogador: ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35.0,
                ),
              ),
              Text(
                (playerTurn == 2) ? widget.userName : widget.userName2,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 40.0,
                ),
              ),
              const SizedBox(
                height: 100.0,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (box0 == 0) {
                            box0 = playerTurn;
                            if (playerTurn == 1) {
                              setState(() {
                                iconSelector0 = icons[0];
                              });
                            } else {
                              setState(() {
                                iconSelector0 = icons[1];
                              });
                            }
                            boxClicked();
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
                            box1 = playerTurn;
                            if (playerTurn == 1) {
                              setState(() {
                                iconSelector1 = icons[0];
                              });
                            } else {
                              setState(() {
                                iconSelector1 = icons[1];
                              });
                            }
                            boxClicked();
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
                            box2 = playerTurn;
                            if (playerTurn == 1) {
                              setState(() {
                                iconSelector2 = icons[0];
                              });
                            } else {
                              setState(() {
                                iconSelector2 = icons[1];
                              });
                            }
                            boxClicked();
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
                            box3 = playerTurn;
                            if (playerTurn == 1) {
                              setState(() {
                                iconSelector3 = icons[0];
                              });
                            } else {
                              setState(() {
                                iconSelector3 = icons[1];
                              });
                            }
                            boxClicked();
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
                            box4 = playerTurn;
                            if (playerTurn == 1) {
                              setState(() {
                                iconSelector4 = icons[0];
                              });
                            } else {
                              setState(() {
                                iconSelector4 = icons[1];
                              });
                            }
                            boxClicked();
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
                            box5 = playerTurn;
                            if (playerTurn == 1) {
                              setState(() {
                                iconSelector5 = icons[0];
                              });
                            } else {
                              setState(() {
                                iconSelector5 = icons[1];
                              });
                            }
                            boxClicked();
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
                            box6 = playerTurn;
                            if (playerTurn == 1) {
                              setState(() {
                                iconSelector6 = icons[0];
                              });
                            } else {
                              setState(() {
                                iconSelector6 = icons[1];
                              });
                            }
                            boxClicked();
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
                            box7 = playerTurn;
                            if (playerTurn == 1) {
                              setState(() {
                                iconSelector7 = icons[0];
                              });
                            } else {
                              setState(() {
                                iconSelector7 = icons[1];
                              });
                            }
                            boxClicked();
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
                            box8 = playerTurn;
                            if (playerTurn == 1) {
                              setState(() {
                                iconSelector8 = icons[0];
                              });
                            } else {
                              setState(() {
                                iconSelector8 = icons[1];
                              });
                            }
                            boxClicked();
                          }
                        },
                        iconSize: 60.0,
                        icon: iconSelector8,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Text(
                    "${widget.userName}:",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      iconSize: 20.0,
                      icon: const Icon(Icons.circle_outlined)),
                ],
              ),
              Row(
                children: [
                  Text(
                    "${widget.userName2}:",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      iconSize: 20.0,
                      icon: const Icon(Icons.clear_outlined)),
                ],
              ),
              const SizedBox(
                width: 400.0,
                child: Divider(
                  color: Colors.black,
                  thickness: 5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Placar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${widget.userName}: $gamesPlayer1",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    "${widget.userName2}: $gamesPlayer2",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
