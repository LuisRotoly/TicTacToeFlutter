import 'package:flutter/material.dart';

//
class Box extends StatelessWidget {
  const Box({
    super.key,
    required this.playerTurn,
    required this.boxNumber,
    required this.boxValues,
    required this.iconBox,
    required this.iconNumber,
    required this.boxClicked,
    required this.changeBoxValue,
    required this.changeIconBox,
  });

  final int playerTurn;
  final int boxNumber;
  final List boxValues;
  final Icon iconBox;
  final int iconNumber;
  final Function boxClicked;
  final Function changeBoxValue;
  final Function changeIconBox;

  @override
  Widget build(BuildContext context) {
    List icons = [
      const Icon(Icons.clear_outlined),
      const Icon(Icons.circle_outlined),
    ];

    return IconButton(
      onPressed: () {
        if (boxValues[boxNumber] == 0) {
          changeBoxValue(boxNumber, playerTurn);
          if (playerTurn == 1) {
            changeIconBox(iconNumber, icons[0]);
          } else {
            changeIconBox(iconNumber, icons[1]);
          }
          boxClicked();
        }
      },
      iconSize: 60.0,
      icon: iconBox,
    );
  }
}
