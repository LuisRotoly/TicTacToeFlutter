import 'package:flutter/material.dart';
import './scoreboard.dart';
import './subtitle.dart';
import './game_board.dart';

class GamePage extends StatefulWidget {
  const GamePage({
    super.key,
    required this.userName1,
    required this.userName2,
  });

  final String userName1;
  final String userName2;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int _playerTurn = 1;
  int gamesWonPlayer1 = 0;
  int gamesWonPlayer2 = 0;

  void _whitchPlayerTurn(int numberPlayer) {
    setState(() {
      _playerTurn = numberPlayer;
    });
  }

  void _addPlayerWonGames(String player) {
    if (player == "player1") {
      setState(() {
        gamesWonPlayer1++;
      });
    } else if (player == "player2") {
      setState(() {
        gamesWonPlayer2++;
      });
    }
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
                (_playerTurn == 1) ? widget.userName1 : widget.userName2,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 40.0,
                ),
              ),
              const SizedBox(
                height: 100.0,
              ),
              GameBoard(
                whitchPlayerTurn: _whitchPlayerTurn,
                userName1: widget.userName1,
                userName2: widget.userName2,
                addPlayerWonGames: _addPlayerWonGames,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Subtitle(
                userName1: widget.userName1,
                userName2: widget.userName2,
              ),
              ScoreBoard(
                  userName1: widget.userName1,
                  userName2: widget.userName2,
                  gamesWonPlayer1: gamesWonPlayer1,
                  gamesWonPlayer2: gamesWonPlayer2),
            ]),
      ),
    );
  }
}
