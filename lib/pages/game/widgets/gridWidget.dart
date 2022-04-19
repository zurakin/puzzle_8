import 'package:flutter/material.dart';
import 'package:puzzle_8/model/game/game.dart';
import 'package:puzzle_8/model/game/tile.dart';
import 'package:puzzle_8/widgets/customText.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({Key? key}) : super(key: key);

  @override
  _GridWidgetState createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  late Game game;

  @override
  void initState() {
    super.initState();
    game = Game();
  }

  void newGame() {
    setState(() {
      game.newGame();
    });
  }

  void undo() {
    setState(() {
      game.undo();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double tileWidth = (width - 10) / 3;
    return ListView(
      children: [
        const SizedBox(
          height: 10,
        ),
        for (int i = 0; i < 3; i++) _buildRow(i, tileWidth),
        const SizedBox(
          height: 10,
        ),
        _buildButton("Undo", undo),
        const SizedBox(
          height: 10,
        ),
        _buildButton("New game", newGame),
      ],
    );
  }

  Widget _buildRow(int y, double tileWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 3; i++)
          _buildTile(game.grid[y][i], () {
            setState(() {
              game.tryMove(Tile(i, y));
            });
          }, tileWidth)
      ],
    );
  }

  Widget _buildTile(int tile, Function() onTap, double tileWidth) {
    bool hidden = tile == 9 && !game.hasGameEnded();
    String text = hidden ? "" : tile.toString();
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.5),
          color: hidden ? Colors.transparent : Colors.white,
        ),
        child: Center(child: CustomText(text: text)),
        width: tileWidth,
        height: tileWidth,
      ),
    );
  }

  Widget _buildButton(String text, Function() onPress) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 5),
            fixedSize: const Size(200, 50),
          ),
          onPressed: onPress,
          child: CustomText(
            text: text,
            size: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
