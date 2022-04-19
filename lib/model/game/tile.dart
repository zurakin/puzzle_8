class Tile {
  int x;
  int y;

  Tile(this.x, this.y);

  bool hasLeft() => (x > 0);

  bool hasRight() => (x < 2);

  bool hasTop() => (y > 0);

  bool hasBottom() => (y < 2);

  Tile getLeft() => Tile(x - 1, y);

  Tile getRight() => Tile(x + 1, y);

  Tile getTop() => Tile(x, y - 1);

  Tile getBottom() => Tile(x, y + 1);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tile &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}
