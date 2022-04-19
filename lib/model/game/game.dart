import 'dart:math';

import 'package:puzzle_8/model/history.dart';
import 'package:puzzle_8/model/game/tile.dart';

import 'grid.dart';
import 'move.dart';

class Game {
  Grid grid = Grid([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ]);
  History history = History();

  Game() {
    shuffleGrid(100);
  }

  void applyMove(Move move, bool addToHistory) {
    grid.applyMove(move);
    if (addToHistory) {
      history.registerMove(move);
    }
  }

  void tryMove(Tile tile) {
    if (grid.isComplete()) {
      return;
    }
    Move move = Move(tile, grid.getTile9());
    if (grid.getPossibleMoves().contains(move)) {
      applyMove(move, true);
    }
  }

  void shuffleGrid(int shufflesCount) {
    for (int i = 0; i < shufflesCount; i++) {
      List<Move> possibleMoves = grid.getPossibleMoves();
      applyMove(possibleMoves[Random().nextInt(possibleMoves.length)], false);
    }
  }

  void undo() {
    if (history.canPop()){
      applyMove(history.pop()!.getOppositeMove(), false);
    }
  }

  void newGame() {
    shuffleGrid(100);
    history.clear();
  }

  bool isComplete() {
    return grid.isComplete();
  }
}
