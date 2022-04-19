import 'dart:io';

import 'package:puzzle_8/model/game/tile.dart';

import 'move.dart';

class Grid {
  final List<List<int>> grid;

  Grid(this.grid);

  List<int> operator [](int y){
    return grid[y];
  }
  
  Grid copy() {
    return Grid([
      for (int y = 0; y < 3; y++) [for (int x = 0; x < 3; x++) grid[y][x]]
    ]);
  }

  void applyMove(Move move){
    Tile from = move.from;
    Tile to = move.to;
    int temp = grid[to.y][to.x];
    grid[to.y][to.x] = grid[from.y][from.x];
    grid[from.y][from.x] = temp;
  }

  bool isComplete() {
    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 3; x++) {
        if (grid[y][x] != 3 * y + x + 1) {
          return false;
        }
      }
    }
    return true;
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

  void displayGrid() {
    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 3; x++) {
        stderr.write("${grid[y][x]} ");
      }
      stderr.write("\n");
    }
  }
}
