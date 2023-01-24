import 'package:flutter/material.dart';

//
class Subtitle extends StatelessWidget {
  const Subtitle({
    super.key,
    required this.userName1,
    required this.userName2,
  });

  final String userName1;
  final String userName2;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Text(
            "$userName1:",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22.0,
            ),
          ),
          IconButton(
            onPressed: () {},
            iconSize: 20.0,
            icon: const Icon(Icons.clear_outlined),
          ),
        ],
      ),
      Row(
        children: [
          Text(
            "$userName2:",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22.0,
            ),
          ),
          IconButton(
            onPressed: () {},
            iconSize: 20.0,
            icon: const Icon(Icons.circle_outlined),
          ),
        ],
      ),
    ]);
  }
}
