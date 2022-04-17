import 'package:flutter/material.dart';
import 'package:puzzle_8/constants/style.dart';
import 'package:puzzle_8/pages/game/widgets/grid.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: gameBackgroundColor,
      alignment: Alignment.center,
      width: double.infinity,
      child: const Center(
        child: Grid(),
      ),
    );
  }
}
