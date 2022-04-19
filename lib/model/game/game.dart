import 'dart:io';
import 'dart:math';

import 'package:puzzle_8/model/history.dart';
import 'package:puzzle_8/model/game/tile.dart';

import 'move.dart';

class Game {
  List<List<int>> grid = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  History history = History();

  Game() {
    shuffleGrid(100);
  }

  Tile getTile9() {
    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 3; x++) {
        if (grid[y][x] == 9) {
          return Tile(x, y);
        }
      }
    }
    return Tile(-1, -1);
  }

  List<Move> getPossibleMoves() {
    List<Move> possibleMoves = [];
    Tile tile9 = getTile9();
    if (tile9.hasLeft()) {
      possibleMoves.add(Move(tile9.getLeft(), tile9));
    }
    if (tile9.hasRight()) {
      possibleMoves.add(Move(tile9.getRight(), tile9));
    }
    if (tile9.hasTop()) {
      possibleMoves.add(Move(tile9.getTop(), tile9));
    }
    if (tile9.hasBottom()) {
      possibleMoves.add(Move(tile9.getBottom(), tile9));
    }
    return possibleMoves;
  }

  void applyMove(Move move, bool addToHistory) {
    Tile from = move.from;
    Tile to = move.to;
    int temp = grid[to.y][to.x];
    grid[to.y][to.x] = grid[from.y][from.x];
    grid[from.y][from.x] = temp;
    if (addToHistory) {
      history.registerMove(move);
    }
  }

  void tryMove(Tile tile) {
    if (hasGameEnded()) {
      return;
    }
    Move move = Move(tile, getTile9());
    if (getPossibleMoves().contains(move)) {
      applyMove(move, true);
    }
  }

  bool hasGameEnded() {
    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 3; x++) {
        if (grid[y][x] != 3 * y + x + 1) {
          return false;
        }
      }
    }
    return true;
  }

  void shuffleGrid(int shufflesCount) {
    for (int i = 0; i < shufflesCount; i++) {
      List<Move> possibleMoves = getPossibleMoves();
      applyMove(possibleMoves[Random().nextInt(possibleMoves.length)], false);
    }
  }

  void displayGrid() {
    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 3; x++) {
        stderr.write("${grid[y][x]} ");
      }
      stderr.write("\n");
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
}
