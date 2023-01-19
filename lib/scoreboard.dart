import 'package:flutter/material.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({
    super.key,
    required this.userName1,
    required this.userName2,
    required this.gamesWonPlayer1,
    required this.gamesWonPlayer2,
  });

  final int gamesWonPlayer1;
  final int gamesWonPlayer2;
  final String userName1;
  final String userName2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              "$userName1: $gamesWonPlayer1",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Text(
              "$userName2: $gamesWonPlayer2",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
