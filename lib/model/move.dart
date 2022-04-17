import 'package:puzzle_8/model/tile.dart';

class Move {
  Tile from;
  Tile to;

  Move(this.from, this.to);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Move &&
          runtimeType == other.runtimeType &&
          from == other.from &&
          to == other.to;

  Move getOppositeMove(){
    return Move(to, from);
  }
}
