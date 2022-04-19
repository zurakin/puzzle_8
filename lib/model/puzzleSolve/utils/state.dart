import 'dart:math';

import 'package:puzzle_8/model/game/grid.dart';

class State {
  late Grid grid;

  State(Grid grid){
    this.grid = grid.copy();
  }

  int get id {
    int id = 0;
    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 3; x++) {
        id += pow(10, (3 * y + x)) * grid[y][x] as int;
      }
    }
    return id;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is State && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id;
}
