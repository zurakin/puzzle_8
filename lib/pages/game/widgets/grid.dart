import 'package:flutter/material.dart';
import 'package:puzzle_8/model/game.dart';
import 'package:puzzle_8/model/tile.dart';
import 'package:puzzle_8/widgets/customText.dart';

class Grid extends StatefulWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  late Game game;

  @override
  void initState() {
    super.initState();
    game = Game();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _getRow(0),
        _getRow(1),
        _getRow(2),
        TextButton(
          onPressed: () {
            setState(() {
              game.shuffleGrid(100);
            });
          },
          child: CustomText(
            text: "Shuffle",
            size: 30,
          ),
        ),
      ],
    );
  }

  Widget _getRow(int y) {
    List<Widget> children = [];
    for (int i = 0; i < 3; i++) {
      children.add(_tileWidget(game.grid[y][i], () {
        setState(() {
          game.tryMove(Tile(i, y));
        });
      }));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  Widget _tileWidget(int tile, Function() onTap) {
    bool hidden = tile == 9 && !game.hasGameEnded();
    String text = hidden ? "" : tile.toString();
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.5),
          color: hidden ? Colors.transparent: Colors.white,
        ),
        child: Center(child: CustomText(text: text)),
        width: 100,
        height: 100,
      ),
    );
  }
}